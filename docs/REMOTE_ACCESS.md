# Remote Access and Tunnels

NexHound is currently a local CLI with `help` and `version` commands. It does **not** run a web server or dashboard, so a tunnel cannot expose NexHound itself yet. This guide covers a future optional dashboard or another local HTTP service you are authorized to share.

## Prefer the least-exposed option

1. **Local-only (best default):** bind development services to `127.0.0.1`. Nothing is exposed to the LAN or internet.
2. **Private team access:** prefer a VPN/private network or Tailscale Serve rather than a public URL.
3. **Temporary public preview/webhook testing:** a Cloudflare Quick Tunnel or similar developer tunnel. Assume anyone with the URL can access the service unless you add an access-control layer.
4. **Stable production hostname:** use a named Cloudflare Tunnel with an explicit hostname, authentication/Cloudflare Access, logging, and a runbook.

Never tunnel an unauthenticated admin panel, secrets, a local file browser, a shell, or arbitrary scanning controls. Do not expose sensitive diagnostics or host inventory without authentication and explicit consent.

## Cloudflare Quick Tunnel (development only)

Prerequisites: install `cloudflared` and start a local HTTP service you own. For an example service on port 8080:

```sh
cloudflared tunnel --url http://127.0.0.1:8080
```

Open the temporary `https://....trycloudflare.com` URL printed by the command. Stop it with Ctrl+C. The hostname is temporary and the service is public to anyone who has the URL; do not use this for production or sensitive interfaces.

Official guides:
- [Cloudflare Tunnel overview](https://developers.cloudflare.com/tunnel/)
- [Quick Tunnels](https://developers.cloudflare.com/tunnel/get-started/quick-tunnels/)
- [Cloudflare downloads](https://developers.cloudflare.com/tunnel/downloads/)

## Stable Cloudflare Tunnel

For a long-lived hostname, create a named tunnel and publish a route in the Cloudflare dashboard. You'll need a Cloudflare account and a domain connected to Cloudflare. Use least-privilege tokens, store credentials outside the repository, and prefer Cloudflare Access for protected internal tools.

Follow the [Cloudflare setup guide](https://developers.cloudflare.com/tunnel/get-started/). Never commit a tunnel token or `cert.pem` to source control, shell history, examples, screenshots, or logs.

## Alternatives

| Option | Best for | Trade-offs |
|---|---|---|
| **Tailscale Serve** | Private sharing among devices in your tailnet | Clients join your tailnet; private by default |
| **Tailscale Funnel** | HTTPS URL for a selected local service | Public exposure; Funnel must be enabled for the tailnet |
| **ngrok** | Quick webhooks and demos with inspection features | Account/usage limits may apply; avoid sending secrets |
| **SSH port forwarding** | Private access over an existing SSH connection | Requires an SSH-reachable host; no public app URL |
| **Self-hosted reverse proxy/VPN** | Stable infrastructure with more control | You operate TLS, access control, patching, and monitoring |

References:
- [Tailscale Serve](https://tailscale.com/docs/reference/tailscale-cli/serve)
- [Tailscale Funnel](https://tailscale.com/docs/features/tailscale-funnel)
- [ngrok docs](https://ngrok.com/docs)
- [OpenSSH manual](https://man.openbsd.org/ssh)

## Future NexHound dashboard requirements

Before adding a tunnel integration:
- Keep the dashboard disabled by default and bind only to `127.0.0.1`.
- Require explicit opt-in before public exposure and show the exact local address and public URL.
- Add authentication and CSRF protections before state-changing routes.
- Provide status, stop, cleanup, and graceful-shutdown handling.
- Do not enable boot persistence or a tunnel service automatically.
- Explain when traffic leaves the machine and which provider handles it.
- Test loopback binding, authentication, shutdown, and configuration parsing.
