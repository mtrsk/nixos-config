{pkgs, ...}:

{
  home.packages = with pkgs; [
    # CLIs
    buf
    cachix
    # Language-Related
    dhall-lsp-server
    nixfmt
    rnix-lsp
    sumneko-lua-language-server
    terraform-ls
    # Tools
    bloomrpc
    postman
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
    #
    dotnet-sdk
  ];
}
