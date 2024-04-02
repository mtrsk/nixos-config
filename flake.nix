{ 
  description = "NixOS Configuration";

  inputs = {
    emacs = {
      url = "github:nix-community/emacs-overlay/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      # optionally choose not to download darwin deps (saves some resources on Linux)
      inputs.agenix.inputs.darwin.follows = "";
    };

    impermanence.url = "github:nix-community/impermanence";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hosts.url = "github:StevenBlack/hosts";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs = { self, agenix, impermanence, home, hosts, nixos-generators, nixpkgs, ... }@inputs:
  let
    lib = nixpkgs.lib;

    system = "x86_64-linux";

    # see https://github.com/NixOS/nixpkgs/issues/154163
    armOverlays = [
      (final: super: {
        makeModulesClosure = x:
          super.makeModulesClosure (x // { allowMissing = true; });
      })
    ];
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
        ];

        specialArgs = { inherit inputs system; };
      };

      euclid = lib.nixosSystem {
        inherit system;

        specialArgs = { inherit inputs system; };

        modules = [
          impermanence.nixosModules.impermanence
          #agenix.nixosModules.default {
          #  age.secrets."defaults.json".file = ./secrets/defaults.json.age;
          #  age.identity.paths = "/run/user/1000/gnupg/S.gpg-agent.ssh";
          #}
          ./documentation.nix
          ./fonts.nix
          ./hosts/euclid/configuration.nix
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
            home-manager.users.mbenevides = import ./hosts/euclid/home.nix;
          }
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-l13
        ];
      };

      # Libre Potato
      # nix build -L ".#nixosConfigurations.godel.config.system.build.sdImage"
      godel = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = armOverlays; })
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          {
            nixpkgs.config.allowUnsupportedSystem = true;
            nixpkgs.hostPlatform.system = "armv7l-linux";
            nixpkgs.buildPlatform.system = "x86_64-linux";
          }
          ./hosts/godel/configuration.nix
        ];
      };

      # Libre Potato
      # nix build -L ".#nixosConfigurations.godel.config.system.build.sdImage"
      lobachevsky = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = armOverlays; })
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          ./hosts/lobachevsky/configuration.nix
        ];
      };
    };
  };
}
