{pkgs, ...}:

{
  imports =
    [
      ./cloud.nix
      ./git.nix
      ./iac.nix
      ./kubernetes.nix
      ./programming.nix
    ];

  manual.manpages.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv = {
      enable = true;
    };
  };

  programs.tmux = {
    enable = true;

    keyMode = "vi";

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
