#!/bin/sh
# NexHound bootstrap installer. POSIX sh; never requires root.
set -eu

REPO="https://github.com/acm-bitmesra/NexHound.git"
GO_VERSION="1.27.2"
MIN_GO_MAJOR=1
MIN_GO_MINOR=24
BIN_DIR="${NEXHOUND_BIN_DIR:-${HOME:-}/.local/bin}"
CACHE_DIR="${XDG_CACHE_HOME:-${HOME:-}/.cache}/nexhound"
TMP_DIR=""

if [ -t 1 ] && [ "${NO_COLOR+x}" != x ]; then
  C_BLUE=$(printf '\033[1;34m'); C_GREEN=$(printf '\033[1;32m')
  C_YELLOW=$(printf '\033[1;33m'); C_RED=$(printf '\033[1;31m')
  C_DIM=$(printf '\033[2m'); C_RESET=$(printf '\033[0m')
else
  C_BLUE= C_GREEN= C_YELLOW= C_RED= C_DIM= C_RESET=
fi
info() { printf '%s›%s %s\n' "$C_BLUE" "$C_RESET" "$*"; }
ok() { printf '%s✓%s %s\n' "$C_GREEN" "$C_RESET" "$*"; }
warn() { printf '%s!%s %s\n' "$C_YELLOW" "$C_RESET" "$*"; }
die() { printf '%s✗%s %s\n' "$C_RED" "$C_RESET" "$*" >&2; exit 1; }
have() { command -v "$1" >/dev/null 2>&1; }
cleanup() { if [ -n "$TMP_DIR" ] && [ -d "$TMP_DIR" ]; then rm -rf "$TMP_DIR"; fi; }
trap cleanup EXIT HUP INT TERM

download() {
  url=$1 out=$2
  if have curl; then
    curl --fail --location --silent --show-error --retry 2 --connect-timeout 15 "$url" -o "$out"
  elif have wget; then
    wget -q "$url" -O "$out" || return 1
  else
    die "curl or wget is required. Install one and rerun."
  fi
}
sha256_file() {
  if have sha256sum; then sha256sum "$1" | awk '{print $1}'
  elif have shasum; then shasum -a 256 "$1" | awk '{print $1}'
  elif have openssl; then openssl dgst -sha256 "$1" | awk '{print $NF}'
  else die "Cannot verify download: install sha256sum, shasum, or openssl first."
  fi
}
host_os=$(uname -s 2>/dev/null || echo unknown)
host_arch=$(uname -m 2>/dev/null || echo unknown)
case "$host_os" in Linux) go_os=linux ;; Darwin) go_os=darwin ;; *) die "Unsupported OS '$host_os'. Supported: Linux and macOS. Windows users can use WSL." ;; esac
case "$host_arch" in x86_64|amd64) go_arch=amd64 ;; aarch64|arm64) go_arch=arm64 ;; armv6l) go_arch=armv6l ;; *) die "Unsupported CPU '$host_arch'. Supported: amd64 and arm64 (plus Linux armv6l)." ;; esac
if [ "$go_arch" = armv6l ] && [ "$go_os" != linux ]; then die "armv6l is supported on Linux only."; fi

printf '\n%sNexHound%s  %squick setup%s\n' "$C_BLUE" "$C_RESET" "$C_DIM" "$C_RESET"
printf '%sLightweight diagnostics CLI · ACM BIT Mesra%s\n\n' "$C_DIM" "$C_RESET"
have git || die "Git is required for source installation. Install Git and rerun."
[ -n "${HOME:-}" ] || die "HOME is not set. Set HOME and rerun."
mkdir -p "$CACHE_DIR" "$BIN_DIR" || die "Cannot create install directories under HOME. Set NEXHOUND_BIN_DIR to a writable path."
TMP_DIR=$(mktemp -d "${TMPDIR:-/tmp}/nexhound-install.XXXXXX") || die "Could not create a temporary directory."

GO_BIN=""
if have go; then
  candidate=$(command -v go)
  version=$("$candidate" version 2>/dev/null | awk '{print $3}' | sed 's/^go//')
  version_num=$(printf '%s\n' "$version" | awk -F. '{printf "%d%03d\n",$1,$2}')
  required_num=$(printf '%s\n' "$MIN_GO_MAJOR.$MIN_GO_MINOR" | awk -F. '{printf "%d%03d\n",$1,$2}')
  if [ -n "$version_num" ] && [ "$version_num" -ge "$required_num" ]; then GO_BIN=$candidate; fi
fi
if [ -z "$GO_BIN" ]; then
  cached="$CACHE_DIR/go${GO_VERSION}"
  if [ -x "$cached/bin/go" ]; then GO_BIN="$cached/bin/go"
  else
    info "Go 1.24+ not found; bootstrapping isolated Go $GO_VERSION (no sudo, no system changes)."
    go_archive="go${GO_VERSION}.${go_os}-${go_arch}.tar.gz"
    archive="$TMP_DIR/$go_archive"
    metadata="$TMP_DIR/go-downloads.json"
    download "https://go.dev/dl/$go_archive" "$archive" || die "Go download failed. Check the connection and retry."
    download "https://go.dev/dl/?mode=json&include=all" "$metadata" || die "Could not download Go checksum metadata."
    expected=$(python3 - "$metadata" "$go_archive" <<'PY'
import json, sys
path, filename = sys.argv[1:]
try:
    releases = json.load(open(path, encoding="utf-8"))
    for release in releases:
        for item in release.get("files", []):
            if item.get("filename") == filename:
                print(item.get("sha256", ""))
                raise SystemExit(0)
except (OSError, ValueError) as exc:
    print(f"Could not parse Go checksum metadata: {exc}", file=sys.stderr)
    raise SystemExit(1)
raise SystemExit(1)
PY
) || die "Could not find the published checksum for $go_archive. Nothing was installed."
    case "$expected" in *[!0-9a-fA-F]*|'') die "Invalid checksum metadata. Nothing was installed." ;; esac
    [ "${#expected}" -eq 64 ] || die "Invalid SHA-256 metadata. Nothing was installed."
    actual=$(sha256_file "$archive")
    [ "$actual" = "$expected" ] || die "Go archive SHA-256 mismatch. Nothing was installed."
    ok "Verified Go toolchain archive (SHA-256)."
    tar -xzf "$archive" -C "$TMP_DIR" || die "Could not unpack Go archive."
    staged="$TMP_DIR/go"
    rm -rf "$cached"
    mv "$staged" "$cached" || die "Could not install toolchain in user cache."
    GO_BIN="$cached/bin/go"
  fi
fi
info "Building NexHound for $go_os/$go_arch..."
"$GO_BIN" version
git clone --depth 1 "$REPO" "$TMP_DIR/src" >/dev/null 2>&1 || die "Could not clone NexHound. Check network access to GitHub."
(cd "$TMP_DIR/src" && "$GO_BIN" build -trimpath -ldflags="-s -w" -o "$TMP_DIR/nexhound" ./cmd/nexhound) || die "Build failed; temporary files will be cleaned up."
chmod 755 "$TMP_DIR/nexhound"
mv "$TMP_DIR/nexhound" "$BIN_DIR/nexhound"
ok "Installed to $BIN_DIR/nexhound"
case ":${PATH:-}:" in *":$BIN_DIR:"*) ;; *) warn "$BIN_DIR is not in PATH. Add this to your shell profile:"; printf '\n  export PATH="%s:$PATH"\n\n' "$BIN_DIR" ;; esac
printf '\n%sNext steps%s\n' "$C_GREEN" "$C_RESET"
printf '  nexhound help      Show available commands\n  nexhound version   Verify installation\n\n'
printf '%sNote:%s this starter currently implements help and version only. Planned diagnostics are not yet shipped.\n' "$C_YELLOW" "$C_RESET"
printf 'Docs: https://github.com/acm-bitmesra/NexHound#quick-start\n\n'
