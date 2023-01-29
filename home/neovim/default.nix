{ pkgs, lib, config, ... }:

let
  dotfiles = builtins.toString ../../dotfiles/nvim;
  vimPlugins = import ./packages.nix { inherit pkgs config lib; };
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;

    # https://github.com/nix-community/home-manager/issues/1907#issuecomment-934316296
    extraConfig = builtins.concatStringsSep "\n" [
      ''
      luafile ${dotfiles}/settings.lua}
      luafile ${dotfiles}/line.lua}
      luafile ${dotfiles}/lsp.lua}
      luafile ${dotfiles}/tabs.lua}
      luafile ${dotfiles}/files.lua}
      luafile ${dotfiles}/treesitter.lua}
      ''
    ];

    extraPackages = with pkgs; [
      tree-sitter
    ];

    plugins = vimPlugins.base ++ vimPlugins.eyecandy ++ vimPlugins.ui ++ vimPlugins.lsp ++ vimPlugins.tooling;
  };

  xdg.configFile = {
    nvim = {
      source = ../dotfiles/nvim;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
