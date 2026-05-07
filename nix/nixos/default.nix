{ inputs, ... }:
let
  inherit (builtins) fromTOML readFile;
  env = fromTOML (readFile (inputs.self + "/.env"));
  common-modules = [
    ./configuration.nix
    inputs.vscode-server.nixosModules.default
    { services.vscode-server.enable = true; }
  ];
in
{
  perSystem =
    { system, ... }:
    {
      legacyPackages.nixosConfigurations = {
        ChNix = inputs.nixpkgs.lib.nixosSystem {
          inherit system;

          modules = common-modules;

          specialArgs = {
            inherit (inputs) self;
            hostName = "ChNix";
          };
        };

        ChNix-WSL = inputs.nixpkgs.lib.nixosSystem {
          inherit system;

          modules = common-modules ++ [
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
            hostName = "ChNix";
          };
        };
      };
    };
}
