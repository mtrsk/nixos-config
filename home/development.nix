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
    sbt
    poetry
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

  services.lorri.enable = true;
}
