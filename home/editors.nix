{pkgs, lib, config, home, ...}:

let
  pluginGit = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };

  # always installs latest version
  plugin = pluginGit "HEAD";

in
{
  home.packages = with pkgs; [
    vscode
  ];

  programs.neovim = {
    enable = true;

    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ../dotfiles/neovim/init.vim)
      #(lib.strings.fileContents ./plugins.vim)
      #(lib.strings.fileContents ./lsp.vim)
    ];

    plugins = with pkgs.vimPlugins; [
      # you can use plugins from the pkgs
      vim-which-key
      # Base
      ale
      csv-vim
      deoplete-nvim
      direnv-vim
      LanguageClient-neovim
      nerdtree
      tabular
      supertab
      vim-airline
      vim-commentary
      vim-devicons
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
      # LaTeX
      # Nix
      vim-nix
      # Python
      deoplete-jedi
      jedi-vim
      # Terraform
      vim-terraform
      # Extras
      (plugin "kalafut/vim-taskjuggler")
    ];
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}

