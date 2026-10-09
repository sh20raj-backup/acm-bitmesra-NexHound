# Contributing to NexHound

Thanks for helping build NexHound! We welcome code, tests, docs, usability feedback, and carefully scoped diagnostic ideas.

## Before you start

1. Search existing issues and pull requests.
2. For larger changes, open an issue to discuss scope and design before investing significant work.
3. Do not begin work on a feature marked as blocked or assigned to another contributor without checking with maintainers.
4. Never include real personal data, credentials, tokens, IP logs, or location history in examples or test fixtures.

## Development setup

The core is intended to use Go and the standard library first. Install a supported Go toolchain, clone the repository, and create a focused branch.

```bash
git clone https://github.com/acm-bitmesra/NexHound.git
cd NexHound
git switch -c feat/short-description
```

A minimal CLI starter and go.mod are now present. The module declares Go 1.24.0 as its language baseline. Diagnostics listed in ROADMAP.md are not implemented unless a merged command and tests confirm otherwise.

## Workflow

1. Keep pull requests focused on one concern.
2. Follow existing package boundaries and naming conventions.
3. Run `gofmt` on Go files.
4. Run `go test ./...` and `go vet ./...` when a Go module exists.
5. Add or update tests for behavior changes, validation, and failure paths.
6. Update documentation and examples when commands or behavior change.
7. Describe what changed, why it matters, how it was tested, and any limitations.

## Design principles

- Standard-library-first. New dependencies require a clear reason and maintenance review.
- No Docker or external database service as a core requirement.
- Prefer explicit flags and safe defaults over surprising implicit behavior.
- Use timeouts and bounded I/O for network operations.
- Return helpful errors; don't silently swallow failures.
- Keep stdout suitable for results and stderr for diagnostics where practical.
- Ensure cancellation and shutdown are reliable.
- Redact secrets and sensitive values from logs.
- Never require root unless a specific feature genuinely needs it; explain why and provide a least-privilege alternative if possible.
- Network tests must be limited to localhost, controlled lab systems, or targets the operator is authorized to test.
- Sensitive data collection must be transparent, purpose-limited, and opt-in.

## Pull requests

A pull request should include:

- A clear summary and motivation
- Linked issue (when applicable)
- Tests or a reason tests are not applicable
- Documentation updates when needed
- Compatibility and dependency notes
- Privacy/security impact notes for networking or data handling changes

Maintainers may request changes, narrow the scope, or defer a feature if the operational, privacy, portability, or dependency cost is too high.

## Commit messages

Use a short imperative summary, for example:

- `Add DNS lookup validation`
- `Document user service lifecycle`
- `Test TLS expiry formatting`

## First contributions

Good starting points include clarifying documentation, test fixtures with synthetic data, error-message improvements, platform notes, and small diagnostic features with bounded scope.

By contributing, you agree to follow the project Code of Conduct and respect the license terms.
