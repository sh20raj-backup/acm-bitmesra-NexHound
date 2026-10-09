# Product and Engineering Principles

1. **Small core, optional features.** Core commands should not require a dashboard, persistent database, plugin host, or remote service.
2. **Make behavior visible.** Explain what each command reads, changes, or sends over the network.
3. **No surprise persistence.** Background services are opt-in, inspectable, stoppable, and uninstallable.
4. **Privacy before convenience.** Minimize collection, redact reports, and ask permission where needed.
5. **Least privilege.** Run as the current user by default. Explain any privileged operation.
6. **Bound resource use.** Set timeouts, response limits, and cancellation paths.
7. **Standard library first.** Every dependency has a maintenance and binary-size cost.
8. **Test in isolation.** Normal tests should not depend on the public internet.
9. **Portability through boundaries.** Keep OS-specific behavior narrow and report unsupported features honestly.
10. **Incremental engineering.** Ship a small, tested tool before adding plugin systems and dashboards.
