{ pkgs, config, lib, ... }:

let
  plugins = pkgs.vimPlugins;
  private = import ./private.nix { inherit pkgs config; };
in
{
  base = with plugins; [
    nvim-surround
    vim-which-key
    vim-visual-multi
    hologram-nvim
  ];
  eyecandy = with plugins // private; [
    nvim-colorizer-lua
    nvim-cursorline
    nvim-web-devicons
    private.tokyonight-nvim
  ];
  ui = with plugins; [
    # File Tree
    nvim-tree-lua
    # Find/Filter
    plenary-nvim
    telescope-nvim
    # Status Line
    lualine-nvim
    # Tabs
    barbar-nvim
  ];
  lsp = with plugins // private; [
    nvim-cmp
    nvim-lspconfig
    (nvim-treesitter.withPlugins (p:
      [
        p.c
        p.bash
        p.dockerfile
        p.gitignore
        p.lua
        p.markdown
        p.nix
        p.proto
        p.scheme
        p.sql
        p.terraform
        p.yaml
      ]
    ))
    # Snippets
    luasnip
    private.cmp-git
    # CMP Plugins
    cmp-cmdline
    cmp_luasnip
    cmp-nvim-lsp
    cmp-path
    cmp-treesitter
  ];
  tooling = with plugins; [
    direnv-vim
    Ionide-vim
    vim-nix
    vim-terraform
  ];
}
