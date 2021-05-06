{pkgs, home, ...}:

{
  nixpkgs.overlays = [
    (import ../overlays/nvim/neovim.nix)
  ];

  home.packages = with pkgs; [
    neovim
    tmate
    vscode
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
