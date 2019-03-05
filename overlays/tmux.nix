self: super:

let
  prefix = "a";
  mode-key="vi";
in
{
  tmux = super.tmux.overrideAttrs (old : rec {
    plugins = with super.tmuxPlugins; [
      continuum
      prefix-highlight
      resurrect
      sessionist
      yank
    ];
    tmuxConf = ''
    # Set scrollback limit
    set -g history-limit 10000

    # -----------------------------------
    #       Keybinds
    # -----------------------------------

    # Rebind PREFIX to C-a

    unbind C-b
    set -g prefix C-${prefix}
    bind ${prefix} send-prefix
    bind C-${prefix} last-window

    # No need to keep fingers on ctrl
    bind-key C-d detach-client
    bind-key C-p paste-buffer

    # Set first window to 1 to map better
    # with [1,2,..,9,0] keyboard layout

    set -g base-index 1
    set -g pane-base-index 1

    # Splits with C-> (H) C-< (V)
    bind-key C-< split-window -h
    bind-key C-> split-window -v

    # Activate mouse to select pane
    set -g mouse-on

    # Set editor mode
    setw -g mode-keys ${mode-key}

    # Copy from tmux to system clipboard
    # Needs xclip -> sudo apt install xclip
    bind -t vi-copy y copy-pipe "xclip -sel clip -i"

    # List of plugins
    ${self.lib.concatStrings (map (x: "run-shell ${x.rtp}\n") plugins)}
    '';
  });
}

