{pkgs, home, ...}:

{
  nixpkgs.overlays = [
    (import ../overlays/nvim/neovim.nix)
  ];

  home.packages = with pkgs; [
    neovim
    tmate
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
