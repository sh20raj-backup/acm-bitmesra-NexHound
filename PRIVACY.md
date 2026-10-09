# Privacy by Design

NexHound is intended to be a transparent local diagnostics tool. Privacy-sensitive capabilities must be opt-in and must explain what data is accessed, why it is needed, and where it goes.

## Default principles

- Local-first: process diagnostic data on the user's machine whenever practical.
- No background collection by default.
- No automatic telemetry or analytics unless separately designed, documented, and explicitly enabled.
- No silent upload of reports.
- No hidden collection of precise GPS coordinates or browser/device fingerprints.
- No permission bypasses.
- Logs should avoid credentials, tokens, full request bodies, and unnecessary personal data.
- Reports should offer redaction where data may be sensitive.
- Temporary files should use safe permissions and clear retention behavior.

## Network lookups

Public-IP, DNS, HTTP, TLS, and IP-geolocation features may contact third-party services or user-specified hosts. Each such feature must document the destination, data sent, and limitations. IP geolocation is approximate and must never be presented as GPS-grade location.

## Browser geolocation demonstrations

Any browser geolocation demo must be clearly labeled, explain the purpose, use the browser's permission flow, and show what will be shared before sending coordinates to a remote destination. Denial must be a valid outcome and must not trigger deceptive fallbacks.

## Background services

A background service must be opt-in, identifiable, observable, and easy to stop and uninstall. It must not auto-install a system-wide service or obtain root privileges without an explicit, justified action.

## Retention and deletion

Every feature that stores sensitive information must define storage location, file permissions, retention, and deletion behavior before release. The project should not retain data merely because it may be useful later.

## Reporting privacy issues

Please use the private reporting process described in [SECURITY.md](SECURITY.md).
