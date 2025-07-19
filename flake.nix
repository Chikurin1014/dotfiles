{
  description = "Home Manager configuration of Jane Doe";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixGL is required if you are not using NixOS
    nixgl = {
      url = "github:nix-community/nixgl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, flake-utils, home-manager, nixgl, ... }:
    flake-utils.lib.eachDefaultSystem(system:
    let
      inherit system;
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      legacyPackages = {
        inherit (pkgs) home-manager;
        homeConfigurations.chikurin = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit nixgl;
          };

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./home-manager/home.nix ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
      };
    });
}
