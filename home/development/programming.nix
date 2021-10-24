{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Languages tooling
    cachix
    nixfmt
    sumneko-lua-language-server
    rnix-lsp
    # Linters
    hadolint
    shellcheck
    sqlcheck
    yamllint
    # Other stuff
    siege
    taskjuggler
    plantuml
  ];
}
