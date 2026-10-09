# NexHound 🐾

**A lightweight, modular Linux security and network diagnostics toolkit by ACM BIT Mesra.**

NexHound brings practical system diagnostics, network troubleshooting, privacy checks, and authorized security testing utilities into one small, easy-to-use command-line application.

Built for students, developers, system administrators, and security enthusiasts, NexHound prioritizes simplicity, portability, transparent behavior, and a contributor-friendly codebase.

> **Project status: documentation / bootstrap phase.** The feature list below describes the intended direction, not a claim that these features are already implemented. The first engineering milestone is a working, tested Go CLI.

## Principles

- **Lightweight:** no Docker, database server, or heavyweight runtime required.
- **Easy to install:** target a single Go binary and a simple setup path.
- **Linux-first:** support common Linux distributions; keep platform assumptions explicit.
- **Modular:** small, focused, testable utilities.
- **Privacy-first:** no covert tracking, no permission bypass, and no silent exfiltration.
- **Safe by default:** potentially disruptive or sensitive operations require explicit scope and confirmation.
- **Contributor-friendly:** good first issues, documentation, tests, and approachable code.

## Planned capabilities

Implementation will be incremental and tracked in issues.

- System information and health diagnostics
- Network interface and connectivity checks
- DNS, HTTP, TLS, and certificate diagnostics
- Public-IP lookup and optional approximate IP geolocation
- Local service and port inventory for the current machine or explicitly authorized targets
- Transparent browser geolocation demos that require browser permission
- Safe local webhook/request-inspection tools
- JSON and human-readable reports
- Optional local dashboard
- Background service support with status, logs, and clean shutdown

## Technology direction

- **Core:** Go, using the standard library first
- **CLI:** standard library initially; add Cobra only if command structure benefits
- **Terminal UI:** optional Bubble Tea, not required for core use
- **Storage:** files first; SQLite only when a real persistence requirement exists
- **Dashboard:** optional embedded HTML/CSS/JavaScript served by Go
- **Tests:** Go's built-in testing package
- **CI:** GitHub Actions for formatting, tests, and builds
- **Linux background mode:** foreground mode first; optional `systemd --user` service second

The repository should remain useful without Node.js, Docker, a database service, root privileges, or a running dashboard.

## Status and non-goals

NexHound is intended for education, troubleshooting, and **authorized** security work. It is not intended to secretly collect location or device information, bypass browser permissions, deploy persistence onto machines without consent, or scan systems without authorization.

Do not assume every planned command exists yet. See [ROADMAP.md](ROADMAP.md) and [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

## Getting started

This project is in its bootstrap phase. Once the initial Go CLI lands, the supported local development workflow will be documented here. Until then, contributors can help with documentation, design review, architecture proposals, and scoped implementation issues.

Planned developer checks:

```bash
gofmt -w .
go test ./...
go vet ./...
```

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request. Please keep changes focused, add tests where behavior changes, and avoid adding dependencies without explaining the need.

- [Roadmap](ROADMAP.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Security policy](SECURITY.md)
- [Privacy policy](PRIVACY.md)
- [Code of conduct](CODE_OF_CONDUCT.md)
- [License](LICENSE)

## Community

Built collaboratively by the ACM BIT Mesra community. Contributions are welcome from students and other developers who share the goals of responsible security engineering, simple Linux tooling, and maintainable open-source software.
