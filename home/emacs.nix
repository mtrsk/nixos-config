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
        all-the-icons
        company
        use-package
        use-package-chords
        # Deveopment
        direnv
        dockerfile-mode
        elpy
        magit
        plantuml-mode
        nix-mode
        sqlformat
        yaml-mode
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
        # Org
        org-drill
        # Email
        notmuch
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
