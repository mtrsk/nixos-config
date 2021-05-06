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
        direnv
        magit
        use-package
        use-package-chords
        # Org-related
        org-drill
        # See: https://github.com/tigersoldier/company-lsp/issues/147
        company-lsp
        flycheck
        es-mode
        elpy
        rg
        vimrc-mode
        projectile
        evil
        evil-collection
        undo-tree
        rainbow-delimiters
        treemacs
        treemacs-evil
        treemacs-projectile
        treemacs-all-the-icons
        treemacs-magit
        auto-dim-other-buffers
        atom-one-dark-theme
        command-log-mode
        dockerfile-mode
        nix-mode
        swiper
        which-key
        helpful
        yaml-mode
        web-mode
        sqlformat
        yang-mode
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
    #"Emacs.menuBar" = false;
    #"Emacs.toolBar" = false;
    #"Emacs.verticalScrollBars" = false;
    #"Emacs.Font" =
    #  "-CYEL-Iosevka-normal-normal-normal-*-16-*-*-*-d-0-iso10646-1";
  };
}
