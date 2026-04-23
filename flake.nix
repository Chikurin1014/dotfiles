{
  description = "A Nix flake for managing environments and configurations for systems which is used by Chikurin1014";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
      self,
      nixpkgs,
      flake-parts,
      home-manager,
      nixos-wsl,
      vscode-server,
      nixgl,
      nvim-config,
      ...
    }:
    let
      inherit (builtins) fromTOML readFile;
      env = fromTOML (readFile ./.env);
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.home-manager.flakeModules.home-manager
      ];

      flake = {
        overlays = {
          firge-nerd = final: prev: {
            firge-nerd = prev.callPackage ./nix/pkgs/firge-nerd.nix { };
          };
        };

        homeModules.${env.USER} =
          input@{ pkgs, ... }: import ./nix/home.nix (input // { inherit env nvim-config; });
      };

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem =
        {
          system,
          pkgs,
          ...
        }:
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            config = {
              allowUnfree = true; # for gh-copilot
            };
            overlays = [
              self.overlays.firge-nerd
              nixgl.overlay
            ];
          };

          legacyPackages = {
            nixosConfigurations = {
              ChNix = nixpkgs.lib.nixosSystem (
                import ./nix/nixos {
                  inherit env system;
                  inherit vscode-server;
                  hostName = "ChNix";
                }
              );
              ChNix-WSL = nixpkgs.lib.nixosSystem (
                import ./nix/nixos-wsl {
                  inherit env system;
                  inherit vscode-server nixos-wsl;
                  hostName = "ChNix-WSL";
                }
              );
            };

            homeConfigurations.${env.USER} = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;

              # Specify your home configuration modules here, for example,
              # the path to your home.nix.
              modules = [ self.homeModules.${env.USER} ];

              # Optionally use extraSpecialArgs
              # to pass through arguments to home.nix
              extraSpecialArgs = { };
            };
          };

          formatter = pkgs.nixfmt-tree;
        };
    };
}
