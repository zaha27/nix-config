# nix-config

A unified Nix configuration for two machines managed as a single flake:
**light** (MacBook M4, macOS via nix-darwin) and **tiny** (home PC, NixOS).
Configuration is split by host and by layer (system modules, home-manager) so
shared settings live in one place while machine-specific settings stay isolated.

## Structure

| Path | Purpose |
|------|---------|
| `flake.nix` | Entry point — declares all inputs and wires up both hosts |
| `hosts/light/` | macOS host configuration (system-level) |
| `hosts/tiny/` | NixOS host configuration (system-level) |
| `modules/common/` | Packages and settings shared across both machines |
| `modules/darwin/` | macOS-only system settings (nix-darwin) |
| `modules/nixos/` | NixOS-only system settings |
| `home/common/` | home-manager config shared across both machines |
| `home/light/` | home-manager config specific to the MacBook |
| `home/tiny/` | home-manager config specific to the NixOS PC |
| `secrets/` | Encrypted secrets managed by sops-nix (never committed in plain text) |

## WARNING — never commit these

- Private keys (`*.pem`, `*.key`, `id_ed25519`, `id_rsa`, …)
- Plain-text secrets, passwords, tokens, API keys
- `.env` files of any kind
- Unencrypted age or sops files

The `.gitignore` blocks the most common patterns, but it is not foolproof.
**Always double-check `git diff --staged` before committing.**
Secrets must be encrypted with [sops-nix](https://github.com/Mic92/sops-nix) before
they touch the repo.

## How to apply

**macOS (light)**
```bash
nix run nix-darwin -- switch --flake .#light
```

**NixOS (tiny)**
```bash
sudo nixos-rebuild switch --flake .#tiny
```

> Note: these commands will work once the configuration is filled in.
> They are placeholders until the flake outputs are complete.

## Secrets management

Secrets are encrypted with [sops-nix](https://github.com/Mic92/sops-nix).
See `.sops.yaml` for key configuration. Encrypted files live under `secrets/`
and are safe to commit only after encryption.
