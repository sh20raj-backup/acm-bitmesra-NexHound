# Command Design and Status

A command is marked **Implemented** only when its code and tests are merged. Proposed interfaces can change as maintainers learn from implementation.

| Command | Status | Purpose | Safety notes |
|---|---|---|---|
| `nexhound help` | Implemented | Print CLI usage | Local only |
| `nexhound version` | Implemented | Print version and build platform | Local only |
| `nexhound system info` | Implemented | Report OS, architecture, Go runtime, and logical CPU count | Local runtime values only; no identifiers or network calls |
| `nexhound network interfaces` | Planned | List local interfaces | Local only |
| `nexhound network check` | Planned | Check connectivity to an explicit or documented default endpoint | Timeouts required |
| `nexhound dns lookup <host>` | Planned | Resolve a hostname | Validate and normalize input |
| `nexhound http check <url>` | Planned | Inspect status, latency, and selected response headers | Bounded reads; redirects documented |
| `nexhound tls check <host>` | Planned | Inspect TLS certificate metadata | No disabling certificate verification |
| `nexhound ip public` | Planned | Query an external public-IP service | Explicit command; disclose external request |
| `nexhound report export` | Planned | Export a diagnostic report | Redact personal and sensitive values |
| `nexhound service status` | Planned | Check optional user service status | Only after service support exists |

Command interfaces should remain consistent: clear help, explicit arguments, useful exit codes, timeouts, and machine-readable output only when a format is implemented and documented.
