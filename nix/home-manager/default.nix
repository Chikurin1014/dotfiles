{
  inputs,
  ...
}:
let
  inherit (builtins) fromTOML readFile;
  env = fromTOML (readFile (inputs.self + "/.env"));
in
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake = {
    overlays = {
      firge-nerd = final: prev: {
        firge-nerd = prev.callPackage ../pkgs/firge-nerd.nix { };
      };
    };

    homeModules = {
      editor = {
        # Environment variables
        home.sessionVariables = {
          inherit (env) EDITOR;
        };
      };
      git = {
        programs.git = {
          enable = true;
          settings = {
            user = {
              name = env.GIT_USER_NAME;
              email = env.GIT_USER_EMAIL;
            };
            core.editor = env.EDITOR;
          };
        };
      };
      direnv = {
        programs.direnv = {
          enable = true;
          enableFishIntegration = true;
        };
      };
      nvim-config = {
        home.file = inputs.nvim-config.file;
      };
    };
  };

  perSystem =
    { system, pkgs, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true; # for gh-copilot
        };
        overlays = [
          inputs.self.overlays.firge-nerd
          inputs.nixgl.overlay
        ];
      };

      legacyPackages = {
        homeConfigurations.${env.USER} = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            {
              # Home Manager version
              home.stateVersion = "25.11";

              # User name and Home directory
              home.username = env.USER;
              home.homeDirectory = "/home/${env.USER}";

              # Nix settings (that will generate ~/.config/nix/nix.conf)
              nix.package = pkgs.nix;

              # Let Home Manager install and manage itself.
              programs.home-manager.enable = true;
            }
            ./modules/packages.nix
            ./modules/file.nix
            inputs.self.homeModules.editor
            inputs.self.homeModules.git
            inputs.self.homeModules.direnv
            inputs.self.homeModules.nvim-config
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to ./modules/*.nix
          extraSpecialArgs = { inherit (inputs) self; };
        };
      };
    };
}
