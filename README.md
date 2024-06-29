This is personally nixos configuration built using the home manager and flake.

## First clone the GitHub Repository:

```bash
git clone https://github.com/officialrajdeepsingh/nixos-configure.git
```

## Built the NixOS configure

I built the nixos using flake, nixos rebuild and home manager with the following command.

```bash
## First, build the nixos.
sudo nixos-rebuild switch  --flake ~/nixos-config/#default

## Next, install the package using the home manager.
home-manager switch -f ~/nixos-config/home.nix
```

The following package is installed:

1. yazi
2. ffmpegthumbnailer
   unar
   jq
   poppler
   fd
   ripgrep
   fzf
   zoxide
   youtube-music
   youtube-dl
   turso-cli
   google-chrome
   tor-browser
   brave
   rustup
   lua
   zig
   python3
   nodejs_20
   deno
   nodePackages_latest.yarn
   nodePackages_latest.pnpm
   node2nix
   lazygit
   (nerdfonts.override {fonts = ["FiraCode"];})
   git
   gh
   act
   unzip
   curl
   unzip
   wget
   xclip
   tree
   hugo
   zoom-us
   openssl
