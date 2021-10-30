{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Languages tooling
    cachix
    nixfmt
    rnix-lsp
    sumneko-lua-language-server
    terraform-ls
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
