{ inputs, user, ... }:
let
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  stateVersion = "26.05"; # Did you read the comment?

  mkSystem =
    hostName: modules:
    inputs.nixpkgs.lib.nixosSystem {
      modules = [
        ./modules/common.nix

        # VSCode Server
        inputs.vscode-server.nixosModules.default
        { services.vscode-server.enable = true; }
      ]
      ++ modules;

      specialArgs = {
        inherit
          inputs
          user
          stateVersion
          hostName
          ;
      };
    };
in
{
  flake.nixosConfigurations = {
    # NixOS on WSL
    ChNix-WSL = mkSystem "ChNix-WSL" [ ./modules/wsl.nix ];

    # NixOS on a physical machine
    ChNix = mkSystem "ChNix" [ ./modules/baremetal.nix ];
  };
}
