{ inputs, ... }:
let
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  stateVersion = "26.05"; # Did you read the comment?

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
        inherit stateVersion;
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
          inherit stateVersion;
          hostName = "ChNix";
        };
      };
    };
}
