{pkgs, ...}:

{
  home.packages = with pkgs; [
    bfg-repo-cleaner
    gitAndTools.gitflow
    gitAndTools.git-subrepo
    git-crypt
  ];

  programs.git = {
    enable = true;

    userEmail = "marcos.schonfinkel@gmail.com";
    userName = "Marcos Benevides";

    aliases = {
      commit = "commit -S";
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
}
