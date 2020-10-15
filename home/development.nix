{pkgs, home, ...}:

{
  manual.manpages.enable = true;

  home.packages = with pkgs; [
    # clis
    awscli
    aws-vault
    google-cloud-sdk
    heroku
    vault
    # languages tooling
    cachix
    poetry
    sbt
    # linters
    hadolint
    shellcheck
    sqlcheck
    # misc
    insomnia
    # other stuff
    siege
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    aliases = {
      list-staged = "diff --staged";
      list-conflicts = "diff --name-only --diff-filter=U | grep -oE '[^/ ]+$'";
    };
    delta = {
      enable = true;
    };
    lfs = {
      enable = true;
    };
  };

  services.lorri.enable = true;
}
