{ pkgs, config, inputs, system, ... }:

{
  imports =
    [
      # (import ./kitty.nix { inherit pkgs config; })
      (import ./alacritty.nix { inherit pkgs config; })
      (import ./eww.nix { inherit pkgs config inputs system; })
    ];

  home.packages = with pkgs; [
    neofetch
  ];
}
