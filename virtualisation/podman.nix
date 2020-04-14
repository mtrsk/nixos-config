{config, lib, modulesPath, pkgs, options}:

{
  environment.systemPackages = (with pkgs; [
    # A tool which facilitates building OCI images
    buildah
    # An OCI container runtime monitor
    conmon
    # FUSE implementation for overlayfs
    fuse-overlayfs
    # A program for managing pods, containers and container images
    podman
    podman-compose
    # User-mode networking for unprivileged network namespaces
    slirp4netns
  ]);

  environment = {
    etc."containers/registries.conf".text = import ../etc/containers/registries.nix {};
    etc."containers/policy.json".text     = import ../etc/containers/policy.nix {};
  };
}
