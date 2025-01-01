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
3. unar
4. jq
5. poppler
6. fd
7. ripgrep
8. fzf
9. zoxide
10. youtube-music
11. youtube-dl
12. turso-cli
13. google-chrome
14. tor-browser
15. brave
16. rustup
17. lua
18. zig
19. python3
20. nodejs_20
21. deno
22. nodePackages_latest.yarn
23. nodePackages_latest.pnpm
24. node2nix
25. lazygit
26. fira-code-nerdfont
27. git
28. gh
29. act
30. unzip
31. curl
32. unzip
33. wget
34. xclip
35. tree
36. openssl
