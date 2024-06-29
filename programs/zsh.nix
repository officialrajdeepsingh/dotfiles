{
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      zsh-autoenv.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        home = "home-manager switch -f ~/nixos-config/home.nix";
        build = "sudo nixos-rebuild switch  --flake ~/nixos-config/#default";
        build-test = "sudo nixos-rebuild test --flake ~/nixos-config/#default";
      };
      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "npm"
          "history"
          "node"
          "rust"
          "deno"
        ];
      };
    };
  };
}
