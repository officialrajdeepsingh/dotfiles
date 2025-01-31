{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        home = "home-manager switch -f ~/dotfiles/home.nix";
        build = "sudo nixos-rebuild switch  --flake ~/dotfiles/#default";
        build-test = "sudo nixos-rebuild test --flake ~/dotfiles/#default";
        upgrade = "nixos-rebuild switch --upgrade -f --flake ~/dotfiles/#default";
      };
      initExtra = ''
# PNPM HOME Env 
export PNPM_HOME="/home/officialrajdeepsingh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
'';
      completionInit = "pnpm setup";
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
          "zoxide"
        ];
      };
    };
  };
}
