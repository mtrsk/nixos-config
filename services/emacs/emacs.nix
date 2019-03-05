{config, pkgs, ...}:

let
  yukari-akiyama = (pkgs.emacs.override {
    withGTK3 = true;
    withGTK2 = false;
  });
  emacsWithPackages = (pkgs.emacsPackagesNgGen yukari-akiyama).emacsWithPackages;
  yukari-akiyama-pkgs = emacsWithPackages (epkgs:
    (with epkgs.elpaPackages; [
      # LaTeX
      auctex
      company-math
      # Utils
      undo-tree
    ]) ++ (with epkgs.melpaStablePackages; [
      company
      company-auctex
      company-coq
      company-math
      markdown-mode
      proof-general
    ]) ++ (with epkgs.melpaPackages; [
      # Delimiters
      rainbow-delimiters
      smartparens
      # Evil
      avy
      evil
      evil-collection
      evil-commentary
      evil-smartparens
      evil-surround
      # Interface
      bind-key
      company
      ivy
      counsel
      swiper
      projectile  # project management
      ripgrep  # search
      visual-fill-column
      which-key  # display keybindings after incomplete command
      winum eyebrowse # window management
      # Themes
      xresources-theme
      # Utils
      flycheck
      use-package
      # -----------
      # Programming
      # Dockerfile
      dockerfile-mode
      # Elixir
      alchemist
      elixir-mode
      # Nix
      direnv
      nix-mode
      nix-buffer
      # Rust
      cargo
      flycheck-rust
      rust-mode
    ]) ++ (with epkgs.orgPackages; [
      org
      org-plus-contrib
    ])
  );
in
{
  services.emacs = {
    install = true;
    defaultEditor = false;
    package = yukari-akiyama-pkgs;
  };
}
