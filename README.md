# NixOS Configuration

My NixOS configuration files, used in my personal systems and work machines.

## TODO List

   - [X] Use home-manager for user-related configurations
   - [X] Integration with Nix-flakes
   - [X] Integration with the [[https://github.com/nix-community/impermanence][impermanence module]]
   - [ ] Integration with one of the following secret management tools:
     - [[https://github.com/ryantm/agenix][agenix]]
     - [[https://github.com/Mic92/sops-nix][sops-nix]]
   - [ ] Add this entire config into CI

## How to use it?

   - Clone this repo
   - Pick a definition in the flake.nix
   - Build it

```shell
  sudo nixos-rebuild switch --flake .#caladan
  # or
  sudo nixos-rebuild switch --flake .#euclid
```

## Why should I use it?

You probably shouldn't.

## Screenshots

- Neovim
[[./docs/neovim.png]]
