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
    # linters
    hadolint
    shellcheck
    sqlcheck
    # misc
    insomnia
    gitAndTools.git-subrepo
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
        condition = "gitdir:~/Work";
        path = "~/Work/.gitconfig";
      }

      {
        condition = "gitdir:~/Github";
        path = "~/Github/.gitconfig";
      }

      {
        condition = "gitdir:~/Gitlab";
        path = "~/Github/.gitconfig";
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
