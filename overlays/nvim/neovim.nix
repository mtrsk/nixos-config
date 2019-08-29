self: super:

let
  vimPrivatePlugins = (import ./private.nix) super.pkgs;
in
{
  neovim = super.neovim.override {
    withPython3 = true;
    withPython = true;
    vimAlias = true;
    configure = {
      customRC = import ./vimrc.nix super;
      packages.plugins.start = with (self.pkgs.vimPlugins) // (vimPrivatePlugins); [
        vim-plug
      ];
      plug.plugins = with (self.pkgs.vimPlugins) // (vimPrivatePlugins); [
        # Base
        ale
        deoplete-nvim
        LanguageClient-neovim
        nerdtree
        tabular
        supertab
        vim-airline
        vim-commentary
        vim-devicons
        vim-fugitive
        vim-markdown
        vim-trailing-whitespace
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
        # Go
        #deoplete-go
        # Haskell
        haskell-vim
        intero-neovim
        vim-hindent
        vim-stylish-haskell
        # Html
        emmet-vim
        # LaTeX
        vimtex
        # Nix
        vim-nix
        # Python
        deoplete-jedi
        jedi-vim
        # Rust
        nvim-cm-racer
        deoplete-rust
      ];
    };
  };
}
