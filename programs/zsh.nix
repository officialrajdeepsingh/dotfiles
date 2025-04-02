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
        upgrade = "sudo nixos-rebuild switch --upgrade  --flake ~/dotfiles/#default";
        rm-home = "home-manager  remove-generations";
        li-home = "home-manager  generations";
        rm-nixos = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations";
        li-nixos = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      };
      initExtra = ''
# PNPM HOME Env
export PNPM_HOME="/home/officialrajdeepsingh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# FNM Manage the Node version
eval "$(fnm env --use-on-cd --shell zsh)"
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
