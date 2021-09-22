{ pkgs, home, ... }:

let
  emacs-overlay = import (builtins.fetchTarball {
    url =
      "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
  });
in {
  nixpkgs.overlays = [ emacs-overlay ];

  # Treemacs requires python3
  home.packages = with pkgs; [
    emacs-all-the-icons-fonts
    python3
  ];

  services.emacs.enable = true;

  programs.emacs = {
    enable = true;
    extraPackages = (epkgs:
      (with epkgs; [
        # Common
        aggressive-indent
        all-the-icons
        auto-complete
        auto-compile
        company
        rainbow-mode
        rainbow-delimiters
        rainbow-blocks
        use-package
        use-package-chords
        s
        # Formatting
        format-all
        # Deveopment
        ## Languages
        dockerfile-mode
        eshell-syntax-highlighting
        fsharp-mode
        haskell-mode
        nix-mode
        python-mode
        sqlformat
        ## Tooling
        direnv
        lsp-mode
        lsp-ui
        magit
        ## Ops
        plantuml-mode
        terraform-mode
        yaml-mode
        # Email
        notmuch
        # Extra
        auto-dim-other-buffers
        atom-one-dark-theme
        command-log-mode
        evil
        evil-collection
        flycheck
        helpful
        projectile
        treemacs
        treemacs-evil
        treemacs-projectile
        treemacs-all-the-icons
        treemacs-magit
        swiper
        rainbow-delimiters
        rg
        undo-tree
        vimrc-mode
        web-mode
        which-key
        # Notifications
        alert
        # Org
        helm-org-rifle
        org-books
        org-drill
        org-elp
        org-pdftools
        org-ql
        org-roam
        org-superstar
        # Ricing
        ewal
      ]));
  };

  home.file = {
    ".emacs.d" = {
      source = ../dotfiles/emacs.d;
      recursive = true;
    };
  };

  xresources.properties = {
    # Set some Emacs GUI properties in the .Xresources file because they are
    # expensive to set during initialization in Emacs lisp. This saves about
    # half a second on startup time. See the following link for more options:
    # https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html#Fonts
    "Emacs.menuBar" = false;
    "Emacs.toolBar" = false;
    "Emacs.verticalScrollBars" = false;
  };
}
