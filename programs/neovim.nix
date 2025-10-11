{

  programs.nvf = {
    enable = true;

    # Your settings need to go into the settings attribute set most settings are documented in the appendix

    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.theme = {
        enable = true;
        name = "tokyonight";
        style = "night";
      };
      vim.lsp = {
        enable = true;
        inlayHints.enable = true;
        lspconfig.enable = true;
        null-ls.enable = true;
      };
      vim.languages.markdown.enable = true;
      # vim.assistant.chatgpt = {
      #   enable = true;
      #   setupOpts = { };
      # };
      # vim.assistant.copilot.enable = true;
      vim.autocomplete.blink-cmp.enable = true;
      vim.autocomplete.blink-cmp.friendly-snippets.enable = true;
      vim.autopairs.nvim-autopairs.enable = true;
      vim.comments.comment-nvim.enable = true;
      vim.git.enable = true;
      vim.languages.bash.enable = true;
      vim.languages.bash.format.enable = true;
      vim.languages.css.enable = true;
      vim.languages.css.format.enable = true;
      vim.languages.html.enable = true;
      # vim.languages.html.format.enable = true;
      vim.languages.lua.enable = true;
      vim.languages.lua.format.enable = true;
      vim.languages.tailwind.enable = true;
      vim.languages.tailwind.lsp.enable = true;
      vim.languages.ts.enable = true;
      vim.languages.ts.format.enable = true;
      vim.languages.ts.treesitter.enable = true;
      vim.languages.yaml.enable = true;
      vim.languages.zig.lsp.enable = true;
    };
  };
}
