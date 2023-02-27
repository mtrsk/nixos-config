{pkgs, ...}:

{
  home.packages = with pkgs; [
    # CLIs
    buf
    cachix
    protobuf
    # Language-Related
    dhall-lsp-server
    lua-language-server
    nixfmt
    rnix-lsp
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
    sqlite
  ];
}
