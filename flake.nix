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

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # VSCode server
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    nvim-config.url = "github:Chikurin1014/nvim-config";
  };

  outputs =
    inputs@{
      flake-parts,
      ...
    }:
    let
      inherit (builtins) fromTOML readFile;
      # User specific values shared with docker-compose
      env = fromTOML (readFile ./.env);
    in
    flake-parts.lib.mkFlake
      {
        inherit inputs;
        specialArgs = { inherit env; };
      }
      {
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
          { pkgs, ... }:
          {
            devShells.default = pkgs.mkShell {
              packages = with pkgs; [
                bash-language-server
                emmylua-ls
                emmylua-formatter
                fish-lsp
                taplo
                vscode-langservers-extracted
                yaml-language-server
              ];
            };
            formatter = pkgs.nixfmt-tree;
          };
      };
}
