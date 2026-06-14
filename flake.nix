{
  description = "A Nix flake for managing environments and configurations for systems which is used by Chikurin1014";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # VSCode server
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    # nixGL is required if you are not using NixOS
    nixgl.url = "github:nix-community/nixgl";

    nvim-config.url = "github:Chikurin1014/nvim-config";
  };

  outputs =
    inputs@{
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./nix/home-manager
        ./nix/nixos
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      flake = {
        overlays = {
          firge-nerd = final: prev: {
            firge-nerd = prev.callPackage ./nix/packages/firge-nerd.nix { };
          };
        };
      };

      perSystem =
        { system, pkgs, ... }:
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            config = {
              allowUnfree = true; # for gh-copilot
            };
            overlays = [
              inputs.self.overlays.firge-nerd
              inputs.nixgl.overlay
            ];
          };

          formatter = pkgs.nixfmt-tree;
        };
    };
}
