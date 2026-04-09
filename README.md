# NixOS Dotfiles

Personal NixOS configuration using Flakes + Home Manager.

## Repository layout

- `flake.nix` - flake entry point and outputs
- `configuration.nix` - system-level NixOS config
- `home.nix` - user-level Home Manager config
- `programs/` - modular Home Manager program config
- `services/` - modular NixOS service config

## Flake outputs

- `nixosConfigurations.default`
- `homeConfigurations."officialrajdeepsingh@nixos"`

## Quick start

```bash
git clone https://github.com/officialrajdeepsingh/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Apply system configuration:

```bash
sudo nixos-rebuild switch --flake ~/dotfiles/#default
```

Apply Home Manager configuration:

```bash
home-manager switch --flake ~/dotfiles#officialrajdeepsingh@nixos
```

## Useful commands

Test NixOS config without persisting:

```bash
sudo nixos-rebuild test --flake ~/dotfiles/#default
```

Update flake inputs:

```bash
nix flake update --flake ~/dotfiles
```

Upgrade and switch system:

```bash
sudo nixos-rebuild switch --upgrade --flake ~/dotfiles/#default
```

List installed system packages:

```bash
nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq
```

## Shell aliases (from `programs/zsh.nix`)

```bash
home         # home-manager switch --flake ~/dotfiles#officialrajdeepsingh@nixos
build        # sudo nixos-rebuild switch --flake ~/dotfiles/#default
build-test   # sudo nixos-rebuild test --flake ~/dotfiles/#default
upgrade      # sudo nixos-rebuild switch --upgrade --flake ~/dotfiles/#default
flake-update # nix flake update --flake ~/dotfiles
```