{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        home = "home-manager switch -f ~/nixos-config/home.nix";
        build = "sudo nixos-rebuild switch  --flake ~/nixos-config/#default";
        build-test = "sudo nixos-rebuild test --flake ~/nixos-config/#default";
      };
#       initExtra = ''
# # To initialize zoxide with home manager
#
#  eval "$(zoxide init zsh)"
# '';
      oh-my-zsh = {
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
