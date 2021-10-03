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

    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ../dotfiles/neovim/init.vim)
      (lib.strings.fileContents ../dotfiles/neovim/ide.vim)
    ];

    plugins = with pkgs.vimPlugins // (vimPrivatePlugins); [
      # you can use plugins from the pkgs
      vim-which-key
      # Base
      ale
      deoplete-nvim
      direnv-vim
      LanguageClient-neovim
      nerdtree
      nerdtree-git-plugin
      tabular
      supertab
      vim-airline
      vim-commentary
      vim-fugitive
      vim-markdown
      vim-test
      vim-trailing-whitespace
      vim-surround
      wal-vim
      # ----------------------
      # Misc. Language Support
      # ----------------------
      # Agda
      agda-vim
      # C
      deoplete-clang
      # Elixir
      alchemist-vim
      vim-elixir
      # Elm
      elm-vim
      # Haskell
      haskell-vim
      intero-neovim
      vim-hindent
      # Html
      emmet-vim
      # Nix
      vim-nix
      # Python
      deoplete-jedi
      jedi-vim
      # Terraform
      vim-terraform
      # Extras
      vim-taskjuggler
    ];
  };

  xdg.configFile = {
    neovim = {
      source = ../dotfiles/neovim;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}

