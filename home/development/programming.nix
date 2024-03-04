{pkgs, ...}:

{
  home.packages = with pkgs; [
    # SDKs
    dotnet-sdk
    # Language-Related
    lua-language-server
    nixfmt
    rnix-lsp
    terraform-ls
    # Tools
    #dockle
    #hadolint
    shellcheck
    #sqlcheck
    yamllint
    # Other stuff
    #siege
    taskjuggler
    plantuml
  ];
}
