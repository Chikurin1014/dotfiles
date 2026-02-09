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
    let
      inherit (builtins) fromTOML readFile;
      env = fromTOML (readFile ./.env);
    in
    {
      overlays = {
        firge-nerd = final: prev: {
          firge-nerd = prev.callPackage ./nix-packages/firge-nerd.nix { };
        };
      };
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        inherit env system;
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true; # for gh-copilot
          };
          overlays = [
            self.overlays.firge-nerd
          ];
        };
        homeModules.${env.USER} = import ./home-manager {
          inherit env nixgl;
        };
      in
      {
        legacyPackages = {
          inherit (pkgs) home-manager firge-nerd;

          nixosConfigurations = import ./nixos {
            inherit env system;
            inherit nixpkgs;
            inherit vscode-server nixos-wsl;
          };

          homeConfigurations.${env.USER} = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [ homeModules.${env.USER} ];

            # Optionally use extraSpecialArgs
            # to pass through arguments to home.nix
            extraSpecialArgs = { };
          };
        };

        formatter = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      }
    );
}
