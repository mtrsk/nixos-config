{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Languages tooling
    cachix
    nixfmt
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
