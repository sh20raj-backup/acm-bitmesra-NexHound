# Release and Distribution Plan

No versioned release is implied by this plan. Release automation should be enabled when a tested CLI exists.

## Principles

- Publish tagged versions using semantic versioning after maintainers agree to a stable public interface.
- Build reproducible artifacts where practical and publish checksums.
- Build only supported targets; document each supported OS/architecture pair.
- Test binaries on clean environments before publishing.
- Do not ask users to run downloaded scripts as root.
- Keep release notes focused on changes, breaking behavior, known limitations, and security fixes.
- Treat release signing/provenance as a milestone, not a claim until it is actually configured.

## Initial targets

Start with Linux amd64 and arm64 only after CI validates them. Add other platforms based on contributor capacity and test coverage.

## Installation direction

Prefer downloading a versioned binary from a GitHub Release. Provide source-build instructions as an alternative. Do not install or enable background services automatically.
