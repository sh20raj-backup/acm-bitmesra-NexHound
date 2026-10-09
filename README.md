# NexHound 🐾

**A lightweight, modular Linux security and network diagnostics toolkit by ACM BIT Mesra.**

NexHound brings practical system diagnostics, network troubleshooting, privacy checks, and authorized security testing utilities into one small, easy-to-use command-line application.

Built for students, developers, system administrators, and security enthusiasts, NexHound prioritizes simplicity, portability, transparent behavior, and a contributor-friendly codebase.

### Why NexHound?

- **Lightweight by design:** no Docker, database server, or heavyweight runtime.
- **Easy to install:** run a setup script or download a prebuilt Linux binary.
- **Background mode:** start, inspect, and stop supported local services with simple commands.
- **Modular architecture:** utilities are separated into small, testable packages.
- **Linux-first:** designed for common Linux distributions, with portability where practical.
- **Developer-friendly:** clear documentation, sensible defaults, automated tests, and beginner-friendly issues.
- **Privacy-first:** explicit consent for sensitive operations and no covert tracking.
- **Open source:** built collaboratively by the ACM BIT Mesra community.

### Planned capabilities

- System information and health diagnostics
- Network interface and connectivity checks
- DNS, HTTP, TLS, and certificate diagnostics
- Public-IP and approximate IP-geolocation lookups
- Local service and port inspection on authorized systems
- Browser geolocation demonstrations with explicit permission
- Safe local webhook and request-inspection tools
- Structured reports in JSON and human-readable formats
- Optional local web dashboard
- Background service management and log inspection

NexHound is intended for education, troubleshooting, and authorized security work. It does not secretly collect location data, bypass browser permissions, or target systems without authorization.

### Built with

Go, Go's standard library, a lightweight CLI, and SQLite only if persistent local storage becomes necessary.

### Community

NexHound is developed as a collaborative open-source project. Contributions are welcome through issues, documentation improvements, tests, bug fixes, and new utilities that follow the project's security and privacy guidelines.
