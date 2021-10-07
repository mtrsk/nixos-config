{ pkgs, config, inputs, ... }:

{
  imports =
    [
      (import ./kitty.nix { inherit pkgs config; })
    ];
}
