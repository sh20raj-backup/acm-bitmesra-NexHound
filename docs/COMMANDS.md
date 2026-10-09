# Command Design (Proposed)

This page lists proposed command names only. A command must not be documented as implemented until code and tests are merged.

| Command | Purpose | Safety notes |
|---|---|---|
| `nexhound version` | Print build/version information | Local only |
| `nexhound system info` | Report basic host and runtime information | Redact sensitive details |
| `nexhound network interfaces` | List local interfaces | Local only |
| `nexhound network check` | Check connectivity to an explicit or documented default endpoint | Timeouts required |
| `nexhound dns lookup <host>` | Resolve a hostname | Validate and normalize input |
| `nexhound http check <url>` | Inspect status, latency, and selected response headers | Bounded reads; redirects documented |
| `nexhound tls check <host>` | Inspect TLS certificate metadata | No disabling certificate verification |
| `nexhound ip public` | Query an external public-IP service | Explicit command; disclose external request |
| `nexhound report export` | Export a diagnostic report | Redact personal and sensitive values |
| `nexhound service status` | Check optional user service status | Only after service support exists |

Command interfaces should remain consistent: clear help, explicit arguments, useful exit codes, timeouts, and machine-readable output where promised.
