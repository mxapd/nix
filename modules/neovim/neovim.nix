{config, pkgs, inputs, ...}:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      lua-language-server
      pyright
      marksman
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig # needs setup
      #nvim-treesitter.withAllGrammars # needs setup
      telescope-nvim
      telescope-fzf-native-nvim
      vim-flake8
      #undotree # needs setup
      #nvim-tree-lua # needs setup
      #neoscroll-nvim
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./plugins/telescope.lua}
      ${builtins.readFile ./plugins/lsp.lua}
    '';

  };
}
