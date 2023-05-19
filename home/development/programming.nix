{pkgs, ...}:

{
  home.packages = with pkgs; [
    # CLIs
    buf
    cachix
    protobuf
    maven
    jdk11
    # Language-Related
    dhall-lsp-server
    lua-language-server
    nixfmt
    rnix-lsp
    terraform-ls
    # Tools
    postman
    insomnia
    grpcurl
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
