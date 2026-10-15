{
  inputs,
  env,
  ...
}:
let
  stateVersion = "26.05";
  username = env.USER;
in
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake = {
    homeModules = {
      nvim-config = {
        home.file = inputs.nvim-config.file;
      };
    };
  };

  perSystem =
    { lib, pkgs, ... }:
    let
      inherit (pkgs.stdenv.hostPlatform) system isLinux isDarwin;

      mkHomeConfiguration =
        extraModules:
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import inputs.nixpkgs {
            inherit system;
            config = {
              allowUnfree = true; # for gh-copilot
            };
            overlays = [
              inputs.self.overlays.firge-nerd
            ];
          };

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            {
              # Home Manager version
              home.stateVersion = stateVersion;

              # User name
              home.username = username;

              # Home directory
              home.homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";

              # Environment variables
              home.sessionVariables = {
                inherit (env) EDITOR;
              };

              # Let Home Manager install and manage itself.
              programs.home-manager.enable = true;
            }

            ./modules/file.nix
            ./modules/git.nix
            ./modules/direnv.nix

            # OS specific packages
            (if isDarwin then ./modules/packages/darwin.nix else ./modules/packages/linux.nix)

            inputs.self.homeModules.nvim-config
          ]
          ++ extraModules;

          # Optionally use extraSpecialArgs
          # to pass through arguments to ./modules/*.nix
          extraSpecialArgs = {
            inherit (inputs) self;
            inherit env;
          };
        };
    in
    {
      legacyPackages.homeConfigurations = {
        # NixOS (including NixOS-WSL) and macOS
        ${username} = mkHomeConfiguration [ ];
      }
      // lib.optionalAttrs isLinux {
        # Linux distributions other than NixOS (not on WSL)
        # Usage: home-manager switch --flake .#<username>@generic-linux
        "${username}@generic-linux" = mkHomeConfiguration [
          {
            # This also enables targets.genericLinux.gpu, which provides GPU drivers
            # for Nix packages via /run/opengl-driver.
            # Run `sudo non-nixos-gpu-setup` once after the first switch.
            targets.genericLinux.enable = true;
          }
        ];
      };
    };
}
