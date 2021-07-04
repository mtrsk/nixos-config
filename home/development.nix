{pkgs, home, ...}:

{
  manual.manpages.enable = true;

  home.packages = with pkgs; [
    # CLIs
    kubectl
    terraform_0_15
    vault
    # Cloud-provider CLIs
    awscli
    azure-cli
    heroku
    # Firecracker Micro-VM
    firecracker
    firectl
    # languages tooling
    cachix
    # linters
    hadolint
    shellcheck
    sqlcheck
    # misc
    bfg-repo-cleaner
    insomnia
    gitAndTools.gitflow
    gitAndTools.git-subrepo
    git-crypt
    python37Packages.poetry
    # other stuff
    siege
    taskjuggler
    plantuml
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;

    userEmail = "marcos.schonfinkel@protonmail.com";
    userName = "Marcos Benevides";

    aliases = {
      list-staged = "diff --staged";
      list-conflicts = "diff --name-only --diff-filter=U";
    };

    delta = {
      enable = true;
    };

    lfs = {
      enable = true;
    };

    includes = [
      {
        condition = "gitdir:~/Work/";
        path = "~/Work/.gitconfig";
      }

      {
        condition = "gitdir:~/Personal/";
        path = "~/Personal/.gitconfig";
      }

      {
        condition = "gitdir:~/.password-store/";
        path = "~/.password-store/.gitconfig";
      }
    ];
  };

  programs.tmux = {
    enable = true;

    keyMode = "vi";
    # shell = "${pkgs.zsh}/bin/zsh";

    extraConfig = ''
# Setting the prefix from C-b to C-a
set -g prefix C-a
# Free the original Ctrl-b prefix keybinding
unbind C-b
# Setting the delay between prefix and command
set -s escape-time 1
# Ensure that we can send Ctrl-a to other apps
bind C-a send-prefix
# readline beginning-of-line behaviour Ctrl-a a
bind a send-prefix
# history buffer - max number of lines for each window
set -g history-limit 10000
# Set Terminal Emulator Titles - OFF by default
# set -g set-titles on
# Set the base index for windows to 1 instead of 0
set -g base-index 1
# Set the base index for panes to 1 instead of 0
setw -g pane-base-index 1
# Switch to last window
unbind l
bind-key C-a last-window
    '';

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];
  };

  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 34560000;
    defaultCacheTtlSsh = 34560000;
    maxCacheTtl = 34560000;
    maxCacheTtlSsh = 34560000;
  };

  services.lorri.enable = true;
}
