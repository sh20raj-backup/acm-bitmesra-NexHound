# NexHound 🐾

**A lightweight, modular Linux security and network diagnostics toolkit by ACM BIT Mesra.**

NexHound brings practical system diagnostics, network troubleshooting, privacy checks, and authorized security-testing utilities into one small, easy-to-use command-line application.

Built for students, developers, system administrators, and security learners, NexHound prioritizes simplicity, portability, transparent behavior, and a contributor-friendly codebase.

> **Status: bootstrap phase.** A minimal Go CLI currently supports `help` and `version`. Diagnostic commands and background service support are planned, not implemented yet.

## Principles

- **Lightweight:** no Docker, database server, Node.js, or heavyweight runtime required.
- **Easy to install:** build or download a single Go binary.
- **Linux-first:** support common Linux distributions and document platform assumptions.
- **Modular:** small, focused, testable utilities.
- **Privacy-first:** no covert tracking, permission bypass, or silent report upload.
- **Safe by default:** sensitive operations require explicit scope and confirmation.
- **Contributor-friendly:** approachable issues, useful docs, tests, and focused pull requests.

## Current commands

| Command | Status | Purpose |
|---|---|---|
| `nexhound help` | Available | Show usage |
| `nexhound version` | Available | Show version and runtime platform |
| System/network diagnostics | Planned | See [ROADMAP.md](ROADMAP.md) |
| Background service mode | Planned | Optional user-level service after lifecycle tests |

## Planned capabilities

- System information and health diagnostics
- Network interface and connectivity checks
- DNS, HTTP, TLS, and certificate diagnostics
- Public-IP lookup and optional approximate IP geolocation
- Local service and port inventory on the current machine or explicitly authorized systems
- Browser geolocation demonstrations with explicit disclosure and browser permission
- Safe local webhook/request-inspection utilities
- JSON and human-readable reports
- Optional embedded local dashboard
- Background service management, logs, and clean shutdown

## Technology direction

- **Core:** Go, using the standard library first
- **CLI:** start small; consider Cobra only if it solves a clear problem
- **Terminal UI:** optional; not a core dependency
- **Storage:** none by default; SQLite only if persistence is justified
- **Dashboard:** optional embedded HTML/CSS/JavaScript served by Go
- **Tests:** Go's built-in testing package
- **CI:** GitHub Actions for formatting, tests, vet, and builds
- **Background service:** optional `systemd --user` integration after foreground behavior is reliable

Core use must not require Node.js, Docker, an external database, root privileges, or a running dashboard.

## Quick start

Install Go 1.24 or newer, then:

```bash
git clone https://github.com/acm-bitmesra/NexHound.git
cd NexHound

go run ./cmd/nexhound help
go run ./cmd/nexhound version

go test ./...
go vet ./...
go build -o nexhound ./cmd/nexhound
./nexhound help
```

The current starter prints help and version information only. Feature availability is tracked in [ROADMAP.md](ROADMAP.md).

## Project context and contribution

Start with [AGENTS.md](AGENTS.md) for coding-agent instructions and [docs/PROJECT_CONTEXT.md](docs/PROJECT_CONTEXT.md) for the concise project source of truth.

Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

- [Roadmap](ROADMAP.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Development guide](docs/DEVELOPMENT.md)
- [Proposed commands](docs/COMMANDS.md)
- [Engineering principles](docs/PRINCIPLES.md)
- [Threat model](docs/THREAT_MODEL.md)
- [Security policy](SECURITY.md)
- [Privacy policy](PRIVACY.md)
- [Code of conduct](CODE_OF_CONDUCT.md)
- [Release plan](docs/RELEASES.md)
- [License](LICENSE)

## Security and privacy boundaries

NexHound is for education, troubleshooting, and authorized security work. It must not secretly collect location/device information, bypass browser permissions, install persistence without consent, or target systems without authorization.

IP geolocation is approximate and must never be described as GPS. Network features must disclose destinations, use timeouts, bound responses, and make sensitive actions explicit.

## Community

Built collaboratively by the ACM BIT Mesra community. Contributions are welcome from students and other developers who care about responsible security engineering, simple Linux tooling, and maintainable open source.
