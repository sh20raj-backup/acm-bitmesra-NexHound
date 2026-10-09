# Architecture

## Status

This document describes the proposed architecture. It is not evidence that the components have already been implemented.

## Goals

- A small Linux-first executable
- Fast startup and low idle resource use
- No Docker, external database, or Node.js runtime for core commands
- Testable modules with explicit dependencies
- Safe cancellation, bounded network requests, and observable background behavior
- Optional interfaces that do not complicate the core CLI

## Proposed layers

1. **CLI / application layer** — argument parsing, help, exit codes, cancellation, and command dispatch.
2. **Use-case layer** — orchestration for system, network, DNS, HTTP, TLS, and report operations.
3. **Diagnostic packages** — small functions that take explicit inputs and return typed results.
4. **Adapters** — OS-specific reads, HTTP clients, output renderers, and optional local persistence.
5. **Optional interface layer** — embedded dashboard or terminal UI; not required to run CLI diagnostics.

Keep package dependencies directed inward: low-level diagnostics should not depend on terminal UI or HTTP handlers.

## Dependency policy

Start with Go's standard library. Add a library only when it materially improves security, portability, maintainability, or UX. Record the reason and operational cost in the pull request. Avoid plugin mechanisms that execute arbitrary code until a threat model and isolation model exist.

## Errors and output

- Use typed or wrapped errors where they add useful context.
- Use non-zero exit codes on failure.
- Use stable JSON schemas for machine-readable output once commands are introduced.
- Keep sensitive details out of routine logs.
- Add timeouts to network operations and allow cancellation via context.
- Bound response-body reads and avoid unbounded goroutines or retries.

## Configuration

Use sensible defaults and work without a configuration file. If configuration is added, support a documented user-level path and explicit command-line overrides. Never store credentials in committed defaults.

## Background execution

Implement foreground mode first. A service mode may later generate/install a user-level systemd unit after explicit confirmation. It must support status, logs, stop, and uninstall, use least privilege, and avoid broad process-kill commands. Do not daemonize via double-fork as the first implementation strategy.

## Dashboard

The dashboard is optional and should use Go's embedded static assets if it is introduced. Bind to loopback by default. Do not expose it externally unless the user explicitly opts in and appropriate authentication and deployment guidance exist.

## Storage

Do not introduce a database until a feature demonstrates a persistence need. Start with stdout, JSON export, or well-defined files. If persistence is later needed, SQLite can avoid an external service, but encryption, retention, and migration requirements must be discussed.

## Platform support

Linux is the initial target. Isolate operating-system-specific behavior behind small internal interfaces and build tags where appropriate. Report unsupported features clearly rather than silently returning false data.

## Initial implementation slice

The first code PR should ideally add:
- A Go module with an agreed minimum Go version
- `nexhound --help` and `nexhound version`
- A small command dispatch design
- Unit tests
- GitHub Actions for formatting, tests, vet, and Linux builds
- Updated local setup instructions

Avoid scaffolding every future module before a first user-facing command exists.
