# Development Guide

## Prerequisites

The initial CLI starter is written in Go. Install Go 1.24 or newer and Git. Docker, Node.js, and an external database are not required for core development.

The current go.mod declares Go 1.24.0 as the language baseline. Keep documentation, CI, and go.mod aligned if maintainers deliberately update the baseline.

## Clone the repository

```bash
git clone https://github.com/acm-bitmesra/NexHound.git
cd NexHound
```

## Planned quality checks

Once the Go module exists:

```bash
gofmt -w .
go test ./...
go vet ./...
go build ./...
```

Only run commands applicable to the current codebase. Until a runnable CLI lands, documentation-only contributions can be reviewed for links, consistency, and Markdown formatting.

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
