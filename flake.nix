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
      flake-parts,
      ...
    }:
    let
      inherit (builtins) fromTOML readFile;
      env = fromTOML (readFile ./.env);
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.home-manager.flakeModules.home-manager
        ./nix/home-manager
      ];

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
          legacyPackages = {
            nixosConfigurations = {
              ChNix = inputs.nixpkgs.lib.nixosSystem (
                import ./nix/nixos {
                  inherit env system;
                  inherit (inputs) vscode-server;
                  hostName = "ChNix";
                }
              );
              ChNix-WSL = inputs.nixpkgs.lib.nixosSystem (
                import ./nix/nixos-wsl {
                  inherit env system;
                  inherit (inputs) vscode-server nixos-wsl;
                  hostName = "ChNix-WSL";
                }
              );
            };
          };

          formatter = pkgs.nixfmt-tree;
        };
    };
}
