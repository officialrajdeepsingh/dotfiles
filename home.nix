{config, pkgs, inputs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should manage.
  
  home.username = "officialrajdeepsingh";
  home.homeDirectory = "/home/officialrajdeepsingh";

  # enable https://devenv.sh

  # This value determines the Home Manager release that your configuration is compatible with. This helps avoid breakage when a new Home Manager release introduces backwards incompatible changes.
  
  # You should not change this value, even if you update Home Manager. If you do want to update the value, then make sure to first check the Home Manager release notes.
  
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # command for install or rebuild system :  sudo nixos-rebuild switch --flake /etc/nixos/#default

  # Allow to install unfree package in nixos.
  # nixpkgs.config.allowUnfree = true;

  # Using mismatched versions nixos and home manager.
  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    
  # Browser
    google-chrome
    tor-browser

  # Language
    rustup
    lua
    zig
    python3

  # Install for meshery UI
    # go
    # cope
    # gnumake
    # gnumake42

      
  # IDE
    lunarvim
     
  # JavaScript
    nodejs_20
    # nodejs_18
    deno
    # nodePackages_latest.npm
    nodePackages_latest.yarn
    nodePackages_latest.pnpm     
    # turbo
    node2nix

  # Terminal 
    lazygit
    bottom
    (nerdfonts.override { fonts = [ "FiraCode" ]; })

  # Utility
    git
    gh
    act
    unzip
    curl
    unzip 
    wget

  # Utility Command
    xclip
    tree
  
  # thunderbird

  # podcasts
    # gnome-podcasts

  # office
    # libreoffice
   
  # database
    # surrealdb
    # nodePackages.prisma


  # others
    # upwork
    zoom-us
    openssl
   
    
    # It is sometimes useful to fine-tune packages, for example, by applying overrides. You can do that directly here, just don't forget the parentheses. Maybe you want to install Nerd Fonts with a limited number of fonts?

    # You can also create simple shell scripts directly inside your configuration. For example, this adds a command 'my-hello' to your environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

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
