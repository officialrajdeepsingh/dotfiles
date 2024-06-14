This is the nixos configuration built with the home manager and flake.

This is the nixos configuration built with the home manager and flake.

## Clone the GitHub Repository:

```bash
git clone https://github.com/officialrajdeepsingh/nixos-configure.git
```

Now, I built the nixos with the following command.

```bash
home-manager switch -f ~/nixos-config/home.nix
sudo nixos-rebuild switch  --flake ~/nixos-config/#default
```
