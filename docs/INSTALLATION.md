# Installation and Quick Setup

NexHound's installer uses POSIX `sh`. You do not need Go preinstalled, administrator access, Docker, Node.js, or a database.

## One-line setup (Linux / macOS)

Review the script in the repository first, then run:

```sh
curl -fsSL https://raw.githubusercontent.com/acm-bitmesra/NexHound/main/install.sh | sh
```

The script detects your OS and CPU, uses Go 1.24+ if already installed, or downloads Go 1.27.2 into your user cache and validates the archive against Go's published SHA-256 metadata. It builds NexHound and installs only the CLI binary to `~/.local/bin/nexhound` by default. It does not use `sudo`, change the system Go installation, enable a service, open ports, or create a tunnel.

> **Security note:** piping a remote script to a shell executes it immediately. Inspect [`install.sh`](../install.sh) first, or download and review it before running.

## Review-first setup and options

```sh
curl -fsSLo install.sh https://raw.githubusercontent.com/acm-bitmesra/NexHound/main/install.sh
less install.sh
sh install.sh
```

Choose a custom binary directory:

```sh
NEXHOUND_BIN_DIR="$HOME/bin" sh install.sh
```

If the default directory is missing from PATH, add:

```sh
export PATH="$HOME/.local/bin:$PATH"
```

Open a new terminal or reload your shell profile, then run:

```sh
nexhound help
nexhound version
```

## Build from source (contributors)

Install Go 1.24+ and Git, then:

```sh
git clone https://github.com/acm-bitmesra/NexHound.git
cd NexHound
go test ./...
go vet ./...
go build -o ./nexhound ./cmd/nexhound
./nexhound help
```

## Supported installer platforms

| Host | CPU | Status |
|---|---|---|
| Linux | amd64, arm64, armv6l | Supported by the bootstrap path |
| macOS | amd64, arm64 | Supported by the bootstrap path |
| Windows | — | Use WSL or build manually with Go |

The installer needs Git, `curl` or `wget`, `tar`, and a SHA-256 tool (`sha256sum`, `shasum`, or `openssl`) only when it downloads Go. Python 3 is needed to parse Go's published download metadata when bootstrapping a toolchain; Go users with a compatible installed toolchain do not need it.

## Installed files and uninstall

Only the `nexhound` binary is placed in the configured binary directory. A bootstrapped Go toolchain is cached under `$XDG_CACHE_HOME/nexhound` or `~/.cache/nexhound`.

To uninstall the CLI, remove `~/.local/bin/nexhound`. Remove `~/.cache/nexhound/go1.27.2` too if you no longer need the cached compiler.

## Current feature status

The CLI starter currently implements `help` and `version` only. Check the [roadmap](../ROADMAP.md) before expecting diagnostic commands.
