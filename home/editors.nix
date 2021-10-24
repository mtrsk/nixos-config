{ pkgs, lib, config, ... }:

let vimPrivatePlugins = {
  vim-taskjuggler = pkgs.vimUtils.buildVimPlugin {
    name = "vim-taskjuggler";
    src = pkgs.fetchFromGitHub {
      owner = "kalafut";
      repo = "vim-taskjuggler";
      rev = "e94c9a0b06022d11a34310ad5f82c1c2bcd86fb7";
      sha256 = "0f8smjl6wi52p8n1hhl5zhk8i3lpsfndxxdammyybw2vz17s0j8q";
    };
  };
};
in {
  home.packages = with pkgs; [ vscode ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;

    # https://github.com/nix-community/home-manager/issues/1907#issuecomment-934316296
    extraConfig = builtins.concatStringsSep "\n" [
      ''
      luafile ${builtins.toString ../dotfiles/nvim/settings.lua}
      luafile ${builtins.toString ../dotfiles/nvim/line.lua}
      luafile ${builtins.toString ../dotfiles/nvim/lsp.lua}
      luafile ${builtins.toString ../dotfiles/nvim/ide.lua}
      luafile ${builtins.toString ../dotfiles/nvim/tabs.lua}
      luafile ${builtins.toString ../dotfiles/nvim/tree.lua}
      ''
    ];

    plugins = with pkgs.vimPlugins // (vimPrivatePlugins); [
      # Base
      popup-nvim
      plenary-nvim
      nvim-treesitter
      telescope-nvim
      vim-fugitive
      vim-markdown
      vim-trailing-whitespace
      vim-surround
      vim-which-key
      # Eyecandy
      wal-vim
      nvim-colorizer-lua
      nvim-cursorline
      nvim-web-devicons
      # File Tree
      nvim-tree-lua
      # LSP
      cmp-buffer
      cmp-nvim-lsp
      nvim-cmp
      nvim-compe
      nvim-lspconfig
      # Tabs
      barbar-nvim
      # Status Line
      lualine-nvim
      # ----------------------
      # Misc. Language Support
      # ----------------------
      direnv-vim
      # Nix
      vim-nix
      # Terraform
      vim-terraform
      # Extras
      vim-taskjuggler
    ];
  };

  xdg.configFile = {
    nvim = {
      source = ../dotfiles/nvim;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}

