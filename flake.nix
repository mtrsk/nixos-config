{
  description = "Nixos Configuration";

  inputs = {
    emacs = {
      url = "github:nix-community/emacs-overlay/master";
      inputs.nixpkgs.follows = "unstable";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = github:NixOS/nixos-hardware/master;

    # Utilities
    #eww = {
    #  url = "github:elkowar/eww";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    hosts.url = "github:StevenBlack/hosts";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, home, hosts, nix-colors, nixpkgs, ... }@inputs:
  let
    lib = nixpkgs.lib;

    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      caladan = lib.nixosSystem {
        inherit system;

        modules = [
          ./documentation.nix
          ./fonts.nix
          ./hosts/caladan/configuration.nix
          ./overlays
          hosts.nixosModule {
            networking.stevenBlackHosts = {
              enable = true;
              blockPorn = true;
            };
          }
          home.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.leto = import ./hosts/caladan/users.nix;
          }
          nix-colors.homeManagerModule
        ];

        specialArgs = { inherit inputs system; };
      };

      arrakis = lib.nixosSystem {
        inherit system;

        modules = [
          ./documentation.nix
          ./fonts.nix
          ./hosts/arrakis/configuration.nix
          ./overlays
          hosts.nixosModule {
            networking.stevenBlackHosts = {
              enable = true;
              blockPorn = true;
            };
          }
          home.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.leto = import ./hosts/arrakis/users.nix;
          }
          nix-colors.homeManagerModule
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-l13
        ];

        specialArgs = { inherit inputs system; };
      };
    };
  };
}
