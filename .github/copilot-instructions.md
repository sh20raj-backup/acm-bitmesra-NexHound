# NexHound instructions for GitHub Copilot

- NexHound is a lightweight, Linux-first Go diagnostics toolkit. Read AGENTS.md and docs/PROJECT_CONTEXT.md for full project constraints.
- Treat roadmap features as unimplemented unless code and tests prove otherwise.
- Prefer the standard library; core usage must not require Docker, Node.js, an external database, or root.
- Keep diagnostic operations explicit, scoped, bounded by timeouts and response limits, and easy to cancel.
- Preserve privacy by default: no covert collection, hidden uploads, telemetry, tracking, or permission bypasses.
- Bind optional local web interfaces to loopback by default.
- Never disable TLS verification or log secrets.
- Add tests and update documentation whenever behavior changes.
- Run gofmt, go test ./..., and go vet ./... when a Go module is present.
