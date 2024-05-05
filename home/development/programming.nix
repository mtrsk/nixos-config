{pkgs, ...}:

{
  home.packages = with pkgs; [
    # SDKs
    dotnet-sdk_8
    protobuf
    # Language-Related
    lua-language-server
    nil
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
