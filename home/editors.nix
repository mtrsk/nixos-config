{ pkgs, lib, config, ... }:

let
  inherit (pkgs)
    nixpkgs-fmt
    nil
    ;
in
{
  imports =
    [
      ./neovim
    ];

  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    package = pkgs.vscode-fhs;
    userSettings = {
      "update.mode" = "none";

      "editor.formatOnSave" = false;
      "editor.linkedEditing" = true;
      "editor.rulers" = [ 80 120 ];

      # excluded files
      "files.exclude" = {
        # removes these from the search
        "**/.direnv" = true;
        "**/.devenv" = true;
      };

      "workbench.tree.indent" = 15;
      "workbench.colorTheme" = "Default Dark Modern";

      "terminal.integrated.tabs.enabled" = true;

      "window.titleBarStyle" = "custom";
      "window.zoomLevel" = 0;

      # F#
      "FSharp.inlayHints.enabled" = false;
      "FSharp.inlayHints.typeAnnotations" = false;
      "FSharp.inlayHints.parameterNames" = false;

      # HTML
      "[html]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      # Nix
      "nix" = {
        "enableLanguageServer" = true;
        "formatterPath" = "${nixpkgs-fmt}/bin/nixpkgs-fmt";
        "serverPath" = "${nil}/bin/nil";
      };
      "[nix]" = {
        "editor.insertSpaces" = true;
        "editor.tabSize" = 2;
      };
    };

    extensions = with pkgs.vscode-extensions; [
      # .NET
      ms-dotnettools.csharp
      ionide.ionide-fsharp

      # Nix
      jnoortheen.nix-ide

      # Python
      ms-python.python
      ms-toolsai.jupyter
      ms-pyright.pyright

      # Markdown
      yzhang.markdown-all-in-one

      # Misc
      eamodio.gitlens
      editorconfig.editorconfig
      esbenp.prettier-vscode
      gruntfuggly.todo-tree
      mkhl.direnv

      vscodevim.vim
      ms-vsliveshare.vsliveshare
    ];
  };

  programs.vscode.userSettings.editor.fontFamily = "Jetbrains Mono";
  home.packages = with pkgs; [ jetbrains-mono ];
}

