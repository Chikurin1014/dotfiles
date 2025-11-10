{
  description = "A Nix flake for managing environments and configurations for systems which is used by Chikurin1014";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # VSCode server
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    # nixGL is required if you are not using NixOS
    nixgl = {
      url = "github:nix-community/nixgl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      home-manager,
      nixos-wsl,
      vscode-server,
      nixgl,
      ...
    }:
    {
      nixosConfigurations = import ./nixos { inherit nixpkgs nixos-wsl vscode-server; };

      overlays = {
        firge-nerd = final: prev: {
          firge-nerd = prev.callPackage ./nix-packages/firge-nerd.nix { };
        };
      };
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        inherit system;
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            self.overlays.firge-nerd
          ];
        };
      in
      {
        legacyPackages = {
          inherit (pkgs) home-manager firge-nerd;
          homeConfigurations.chikurin = import ./home-manager { inherit pkgs home-manager nixgl; };
        };

        formatter = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
      }
    );
}
