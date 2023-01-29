{ pkgs, lib, config, ... }:

{
  imports =
    [
      ./neovim
    ];

  home.packages = with pkgs; [ vscode ];
}

