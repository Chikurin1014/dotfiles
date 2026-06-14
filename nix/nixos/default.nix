{ inputs, ... }:
let
  inherit (builtins) fromTOML readFile;
  env = fromTOML (readFile (inputs.self + "/.env"));
in
{
  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  flake = {
    nixosConfigurations.ChNix-WSL = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix

        # VSCode Server
        inputs.vscode-server.nixosModules.default
        { services.vscode-server.enable = true; }

        inputs.nixos-wsl.nixosModules.default
        {
          wsl = {
            enable = true;
            defaultUser = env.USER;
          };
        }
      ];

      specialArgs = {
        inherit (inputs) self;
        hostName = "ChNix-WSL";
      };
    };
  };

  perSystem =
    { pkgs, ... }:
    let
      inherit (pkgs.stdenv.hostPlatform) system;
    in
    {
      legacyPackages.nixosConfigurations.ChNix = inputs.nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix

          # VSCode Server
          inputs.vscode-server.nixosModules.default
          { services.vscode-server.enable = true; }
        ];

        specialArgs = {
          inherit (inputs) self;
          hostName = "ChNix";
        };
      };
    };
}
