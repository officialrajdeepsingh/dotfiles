{ pkgs, inputs, ... }: {

  imports = [
    ./programs
  ];

  programs = {
     zoxide = {
         enable = true;
         enableZshIntegration = true;
         enableBashIntegration = true;
         options = [ "--cmd j"];
     };
  };


  home = {
     username = "officialrajdeepsingh";
     homeDirectory = "/home/officialrajdeepsingh";
   };

  # This value determines the Home Manager release that your configuration is compatible with. This helps avoid breakage when a new Home Manager release introduces backwards incompatible changes. You should not change this value, even if you update Home Manager. If you do want to update the value, then make sure to first check the Home Manager release notes.

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Allow to install unfree package in nixos.
  nixpkgs.config.allowUnfree = true;

  # Using mismatched versions nixos and home manager.
  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    ## Yazi File Manager + zoxide
    # install tauri and runing pake CLI   > https://github.com/tw93/Pake
    pkg-config
    gobject-introspection
    cargo-tauri

    ## Yazi File Manager + zoxide
    yazi
    ffmpeg
    imagemagick
    unar
    jq
    poppler
    fd
    ripgrep
    fzf
    bat

    # Terminal
    ptyxis

    # PassWord Manager
    gnome-secrets

    ## IDE
    ripgrep
    zed-editor
    # vscode

    ## youtube music
    youtube-music
    # youtube-dl is unmaintained
    yt-dlp

    ## Database and CLI (install for https://www.openstatus.dev )
    # surrealdb
    # nodePackages.prisma
    turso-cli

    ## Browser
    google-chrome
    tor-browser
    brave
    # arc-browser

    ## Language
    rustup
    gcc
    rustc
    lua
    zig
    python3

    ## JavaScript
     fnm # mange the nodejs version
    deno
    nodePackages_latest.yarn
    nodePackages_latest.pnpm
    node2nix

    ## Terminal
    lazygit
    warp-terminal
    # gitbutler

    ## Utility
    git
    gh
    act
    unzip
    curl
    unzip
    wget
    ffmpeg_7
    motrix
    # Rust packages
    dioxus-cli

    ## Utility Command
    xclip
    tree
    hugo

    ## others
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
