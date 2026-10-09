# Development Guide

## Prerequisites

The CLI is written in Go. Use Go 1.24 or newer and Git for development. End users do not need a global Go installation: see [INSTALLATION.md](INSTALLATION.md) for the user-local bootstrap installer.

Docker, Node.js, and an external database are not required for core development. The current `go.mod` declares Go 1.24.0 as the language baseline. Keep documentation, CI, and `go.mod` aligned when maintainers deliberately update the baseline.

## Clone the repository

```sh
git clone https://github.com/acm-bitmesra/NexHound.git
cd NexHound
```

## Build, test, and run

```sh
gofmt -w ./cmd/nexhound
go test ./...
go vet ./...
go build -o ./nexhound ./cmd/nexhound
./nexhound help
```

## Quality checks

CI runs formatting validation, tests, vet, and build. Run all checks before opening a pull request:

```sh
go test ./...
go vet ./...
go build ./...
```

## Branch naming

Examples:
- `feat/dns-lookup`
- `fix/report-timeout`
- `docs/setup-guide`
- `test/tls-expiry`

## Testing guidance

Use deterministic unit tests wherever possible. Avoid requiring external services for normal test runs. Network integration tests should be opt-in, time-bounded, and limited to controlled endpoints. Use synthetic IPs, hostnames, and reports in fixtures.

## Dependencies

Prefer the standard library. Any new dependency should include a justification, maintenance status, license compatibility, binary-size/runtime effect, and security implications in the PR description.

## Remote access

NexHound is currently a local CLI and does not run an HTTP server. Do not add tunneling to the install flow. If a future local dashboard is implemented, follow [REMOTE_ACCESS.md](REMOTE_ACCESS.md).
