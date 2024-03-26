# https://github.com/nix-community/impermanence#module-usage
{
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      # machine-id is used by systemd for the journal, if you don't persist this
      # file you won't be able to easily use journalctl to look at journals for
      # previous boots.
      "/etc/machine-id"
      { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
    ];
    users.mbenevides = {
      directories = [
        ".local/share/sddm"
        ".local/share/direnv"
        "Code"
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Videos"
        { directory = ".gnupg"; mode = "0700"; }
        { directory = ".local/share/keyrings"; mode = "0700"; }
        { directory = ".password-store"; mode = "0700"; }
        { directory = ".ssh"; mode = "0700"; }
      ];
      files = [
        ".bash_history"
        ".config/systemsettingsrc"
        ".zsh_history"
      ];
    };
  };
}

