{
  config,
  pkgs,
  inputs,
  ...
}: {
  # imports = [ inputs.nixvim.homeManagerModules.nixvim ];  # Import the nixvim module, and it cannot work.

  # programs.nixvim.enable = true; # enable nixvim and i face error.

  home.username = "officialrajdeepsingh";
  home.homeDirectory = "/home/officialrajdeepsingh";

  # This value determines the Home Manager release that your configuration is compatible with. This helps avoid breakage when a new Home Manager release introduces backwards incompatible changes. You should not change this value, even if you update Home Manager. If you do want to update the value, then make sure to first check the Home Manager release notes.

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # command for install or rebuild system :  sudo nixos-rebuild switch --flake /etc/nixos/#default

  # Allow to install unfree package in nixos.
  nixpkgs.config.allowUnfree = true;

  # Using mismatched versions nixos and home manager.
  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    ## IDE
    # lunarvim

    ## youtube music
    youtube-music
    youtube-dl

    ## Database and CLI (install for https://www.openstatus.dev )
    # surrealdb
    # nodePackages.prisma
    turso-cli

    ## Browser
    google-chrome
    tor-browser
    brave

    ## Language
    rustup
    lua
    zig
    python3

    ## JavaScript
    nodejs_20
    deno
    nodePackages_latest.yarn
    nodePackages_latest.pnpm
    node2nix

    ## Terminal
    lazygit
    (nerdfonts.override {fonts = ["FiraCode"];})

    ## Utility
    git
    gh
    act
    unzip
    curl
    unzip
    wget

    ## Utility Command
    xclip
    tree
    hugo

    ## others
    zoom-us
    openssl
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage plain files is through 'home.file'.

  home.file = {
    # Building this configuration will create a copy of 'dotfiles/screenrc' in the Nix store. Activating the configuration will then make '~/.screenrc' a symlink to the Nix store copy.

    # ".screenrc".source = dotfiles/screenrc;

    # You can also set the file content immediately.

    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through 'home.sessionVariables'. If you don't want to manage your shell through Home Manager then you have to manually source 'hm-session-vars.sh' located at  either.

  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  # or
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  # or
  #  /etc/profiles/per-user/officialrajdeepsingh/etc/profile.d/hm-session-vars.sh

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
