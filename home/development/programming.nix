{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Languages tooling
    cachix
    dhall-lsp-server
    nixfmt
    rnix-lsp
    postman
    sumneko-lua-language-server
    terraform-ls
    # Linters
    dockle
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
