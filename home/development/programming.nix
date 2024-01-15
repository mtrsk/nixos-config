{pkgs, ...}:

{
  home.packages = with pkgs; [
    # CLIs
    buf
    cachix
    protobuf
    synth
    # Language-Related
    lua-language-server
    nixfmt
    rnix-lsp
    terraform-ls
    # Tools
    # Linters
    #dockle
    #hadolint
    shellcheck
    #sqlcheck
    yamllint
    # Other stuff
    siege
    taskjuggler
    plantuml
    #
    dotnet-sdk
  ];
}
