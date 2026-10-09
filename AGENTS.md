# Instructions for Coding Agents

These instructions apply to AI coding agents and automated contributors working in this repository.

## Project truth

- Read README.md, docs/PROJECT_CONTEXT.md, docs/ARCHITECTURE.md, docs/PRINCIPLES.md, ROADMAP.md, SECURITY.md, and PRIVACY.md before proposing significant changes.
- The project may be in bootstrap phase. Verify the current tree and tests before claiming a feature exists.
- Roadmap items are proposals until the implementation and tests are merged.
- Do not fabricate command output, CI results, releases, support guarantees, maintainers, or security claims.

## Engineering constraints

- Go is the core implementation language.
- Prefer the Go standard library and avoid dependencies unless there is a written, concrete reason.
- Core commands must not require Docker, Node.js, a database server, or root.
- Keep Linux as the initial target; isolate platform-specific behavior.
- Implement small, complete slices instead of scaffolding many unused abstractions.
- Use context cancellation, timeouts, bounded reads, and explicit error handling for network operations.
- Keep command-line output stable and useful; never leak secrets in logs.
- Use gofmt, go test ./..., and go vet ./... when a Go module exists.
- Add tests for success, validation, failure, and cancellation paths as relevant.
- Keep documentation synchronized with actual behavior.

## Security and privacy boundaries

- Only support authorized diagnostics and scoped lab/testing use.
- Do not implement covert location/device tracking, stealth persistence, browser-permission bypasses, credential theft, covert exfiltration, or unauthorized targeting.
- Browser geolocation must use the browser permission model and clear disclosure.
- Bind optional dashboards to loopback by default.
- Do not disable TLS certificate verification.
- Avoid shell invocation when Go APIs suffice. If a subprocess is necessary, pass arguments safely and scope process management to the process started by the application.
- Do not add telemetry or report uploads by default.
- Do not add real IP logs, private locations, credentials, tokens, or personal data to tests or examples.

## Workflow

1. Inspect the current files and git state before editing.
2. For substantial changes, explain a concise plan and keep the patch focused.
3. Never overwrite existing work without reading the current file.
4. Run relevant checks when possible; explicitly state if a check could not run.
5. Update docs and tests in the same change.
6. Summarize changed files, behavior, checks run, and known limitations.
