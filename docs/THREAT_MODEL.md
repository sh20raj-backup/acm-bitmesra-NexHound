# Threat Model

## Purpose

Identify key risks to consider before implementing network diagnostics, local services, or data collection. This is a starter document and should evolve with the code.

## Assets

- User's local system and files
- Diagnostic reports and logs
- Optional service credentials or configuration
- Integrity of release artifacts
- Target-system availability and privacy

## Trust boundaries

- Command-line arguments and config files are untrusted input.
- Network responses and DNS results are untrusted.
- Third-party geolocation/IP APIs receive request metadata.
- Browser-provided information may be unavailable or inaccurate.
- Optional dashboard requests may originate from unintended local processes or, if misconfigured, remote clients.
- Downloaded binaries and dependencies require supply-chain validation.

## Risks and mitigations

| Risk | Mitigation |
|---|---|
| Accidental testing of an unauthorized target | Scope warnings, explicit target inputs, and safe local defaults |
| Malicious hostname or crafted response | Input validation, timeouts, bounded response sizes, redirect policy |
| Sensitive information in logs | Redaction and data minimization |
| Dashboard exposed to a network | Loopback binding by default, explicit opt-in for remote access |
| Privilege misuse | Least privilege; no default root requirement |
| Service does not stop cleanly | Context cancellation, signal handling, scoped process/service management |
| Compromised download | TLS verification, checksum/signature verification, documented releases |
| Data collection without meaningful consent | Visible disclosure, opt-in, browser permission, no hidden transmission |
| Dependency bloat or supply-chain risk | Standard-library-first policy and dependency review |

## Out of scope

NexHound will not provide stealth collection, permission bypass, unauthorized access, covert persistence, or covert data exfiltration features.

## Review triggers

Update this document when adding remote access, authentication, storage of sensitive data, plugin execution, privileged operations, or new types of active network testing.
