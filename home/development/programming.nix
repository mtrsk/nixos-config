{pkgs, home, ...}:

{
  home.packages = with pkgs; [
    # Languages tooling
    cachix
    rnix-lsp
    # Linters
    hadolint
    shellcheck
    sqlcheck
    # Other stuff
    siege
    taskjuggler
    plantuml
  ];
}
