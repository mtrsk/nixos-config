self: super:

let
  vimPrivatePlugins = (import ./private.nix) super.pkgs;
in
{
  neovim = super.neovim.override {
    withPython3 = true;
    withPython = true;
    configure = {
      customRC = import ./vimrc.nix super;
      packages.plugins.start = with (self.pkgs.vimPlugins) // (vimPrivatePlugins); [
        vim-plug
      ];
      plug.plugins = with (self.pkgs.vimPlugins) // (vimPrivatePlugins); [
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
        #vim-pydocstring
        # Rust
        nvim-cm-racer
        deoplete-rust
        # Terraform
        vim-terraform
        # Extra
        vim-taskjuggler
      ];
    };
  };
}
