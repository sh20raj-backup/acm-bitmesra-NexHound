# NexHound Roadmap

This roadmap describes intended milestones, not completed features. Milestones may change as maintainers review feasibility and community contributions.

## M0 — Project foundation

- [ ] Confirm project scope, maintainers, and license
- [ ] Establish Go module and minimal CLI entry point
- [ ] Add formatting, tests, vet, and Linux build CI
- [ ] Define error handling, exit codes, and output conventions
- [ ] Add contributor, security, and privacy policies
- [ ] Add a clear project status and first good-first-issue labels

## M1 — Useful local CLI

- [x] `nexhound version` and `nexhound help`
- [x] `nexhound system info` using portable, documented sources
- [ ] `nexhound network interfaces`
- [ ] `nexhound network check` for configured endpoints
- [ ] `nexhound dns lookup <hostname>`
- [ ] Human-readable and JSON output
- [ ] Unit tests for parsing, validation, and error paths

## M2 — Network diagnostics

- [ ] HTTP endpoint checks with timeout and bounded response handling
- [ ] TLS certificate metadata and expiry diagnostics
- [ ] Public-IP lookup behind an explicit opt-in command
- [ ] Optional IP geolocation with a clear accuracy caveat
- [ ] Report export with sensitive values redacted by default

## M3 — Background execution

- [ ] Reliable foreground mode and cancellation
- [ ] Process lifecycle and signal handling tests
- [ ] Optional user-level systemd service integration
- [ ] Status, logs, stop, and uninstall flows
- [ ] Least-privilege documentation; no automatic root setup

## M4 — Optional interfaces

- [ ] Optional local-only dashboard, disabled by default
- [ ] Bind to loopback by default
- [ ] Explicit warning and authentication plan before any remote bind
- [ ] Accessibility and responsive layout checks
- [ ] No separate Node.js runtime required to serve built assets

## M5 — Extensibility

- [ ] Stable internal module interface
- [ ] Guidelines for adding a diagnostic
- [ ] Optional SQLite only if local persistence is justified
- [ ] Release binaries and checksums
- [ ] Versioned compatibility and upgrade documentation

## Out of scope

- Covert location/device tracking
- Permission bypasses, stealth persistence, or covert exfiltration
- Unbounded internet-wide scanning
- Credential theft, exploit delivery, or destructive testing
- Requiring Docker, Kubernetes, or a database server for core use

## How to propose a milestone change

Open a feature request describing the user problem, a minimal design, dependencies, portability, privacy impact, and acceptance criteria. Maintainers should prefer small, testable increments over broad feature dumps.
