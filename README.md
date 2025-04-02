# NixOS Dotfiles

This is a personal NixOS configuration built using Home Manager and Flake.

## First clone the GitHub Repository

```bash
git clone https://github.com/officialrajdeepsingh/dotfiles.git
```

## Built the NixOS configure

I built the NixOS using Flake, and Home Manager and ran the following command to complete the NixOS setup.

```bash
## First, build the nixos.
sudo nixos-rebuild switch  --flake ~/dotfiles/#default

## Next, install the package using the home manager.
home-manager switch -f ~/dotfiles/home.nix
```

Check which package is installed:

```bash
nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq
```
