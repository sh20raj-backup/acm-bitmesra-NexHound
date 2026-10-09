# NexHound — Project Context

This file is the concise source of truth for humans, contributors, and AI assistants.

## One-sentence purpose

NexHound is a lightweight, modular, Linux-first command-line toolkit for system diagnostics, network troubleshooting, privacy checks, and explicitly authorized security testing.

## Audience

Students, developers, system administrators, and security learners, including first-time open-source contributors in the ACM BIT Mesra community.

## Current state

The repository began as a README-only bootstrap and now contains project documentation plus a minimal Go CLI starter (`help` and `version`). Product diagnostics remain planned until implemented and tested. Check the current tree, commits, CI, and releases before assuming a feature exists.

## Product requirements

1. Simple local setup and a small compiled Go binary.
2. Core commands work without Docker, Node.js, an external database service, or root privileges.
3. Use standard library first.
4. Begin in foreground mode; add opt-in user-level background service management after lifecycle and shutdown are tested.
5. Keep core functionality useful without an optional dashboard.
6. Clearly distinguish local facts, third-party lookup results, and approximate inference.
7. Network operations have timeouts, bounded response reads, cancellation, and clear destinations.
8. Machine-readable JSON output is introduced only with a documented schema and tests.
9. Platform-specific behavior is isolated; unsupported capabilities are reported honestly.

## Security and privacy requirements

- No covert tracking, silent report upload, permission bypass, stealth persistence, or unauthorized targeting.
- Any browser geolocation demo must provide clear disclosure and rely on browser permission.
- IP geolocation is approximate and is never described as GPS.
- Do not run as root by default.
- Optional dashboard binds to loopback by default.
- No automatic telemetry.
- Sensitive data is minimized and redacted from logs and example reports.
- Active checks are limited to localhost, controlled labs, or targets the operator has permission to test.

## Technology direction

- Language: Go.
- CLI: start small; the standard library is acceptable for the first commands.
- Storage: no database by default; consider SQLite only after a demonstrated persistence need.
- Dashboard: optional embedded HTML/CSS/JavaScript served by Go; no separate Node process.
- Background process: use systemd --user integration on supported Linux systems rather than an untracked self-daemon.
- Quality: tests, gofmt, go vet, CI builds, focused PRs, and standard dependency review.

## What to implement first

The initial executable with help and version, go.mod, tests, and CI is in place. Next add local system information, interface inspection, DNS lookup, and bounded network checks. Do not scaffold empty packages for every future idea.

## Naming

- Repository: acm-bitmesra/NexHound
- Binary: nexhound
- Module: github.com/acm-bitmesra/NexHound unless maintainers choose a different canonical Go module path.
- Default config: no config required.
