# Security Policy

## Scope

NexHound is planned as a local Linux diagnostics and authorized security-testing toolkit. This policy will apply to the repository and released artifacts as implementation begins.

## Reporting a vulnerability

Please do not publish exploitable vulnerability details in a public issue.

Use GitHub's private vulnerability reporting feature if it is enabled for this repository. If it is unavailable, contact the ACM BIT Mesra maintainers through an official private channel and include:

- A concise description and potential impact
- Affected commit, version, operating system, and configuration
- Minimal reproduction steps in a controlled environment
- Suggested mitigation, if known

Do not attach real credentials, private user data, or data collected from systems without authorization.

## Response expectations

Maintainers should acknowledge reports, assess severity, coordinate a fix, and agree on disclosure timing with the reporter. No fixed response-time guarantee is made until maintainers establish a sustainable security-response process.

## Safe development requirements

- Do not commit secrets, tokens, private keys, or captured user data.
- Validate untrusted input and bound network requests, body sizes, and timeouts.
- Use TLS verification; do not disable certificate verification to make a feature work.
- Avoid shelling out when a standard-library API is sufficient.
- If subprocesses are necessary, pass arguments directly rather than building shell command strings.
- Use least privilege and scoped process cleanup.
- Keep dashboards bound to loopback by default.
- No covert tracking, stealth persistence, permission bypasses, or unapproved data collection.
- Scope active checks to localhost, controlled labs, or explicitly authorized targets.
- Publish checksums for release artifacts and review dependency changes.

## Supported versions

No releases are published yet. Support windows will be defined once versioned releases exist.
