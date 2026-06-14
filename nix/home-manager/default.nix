{
  inputs,
  ...
}:
let
  stateVersion = "26.05";
  inherit (builtins) readFile;
  env = fromTOML (readFile (inputs.self + "/.env"));
  username = env.USER;
in
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "aarch64-darwin"
  ];

  flake = {
    homeModules = {
      nvim-config = {
        home.file = inputs.nvim-config.file;
      };
    };
  };

  perSystem =
    { pkgs, ... }:
    let
      inherit (pkgs.stdenv.hostPlatform) system isLinux isDarwin;
    in
    {
      legacyPackages.homeConfigurations.${env.USER} = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs =
          if isLinux then
            import inputs.nixpkgs {
              inherit system;
              config = {
                allowUnfree = true; # for gh-copilot
              };
              overlays = [
                inputs.self.overlays.firge-nerd
                inputs.nixgl.overlay
              ];
            }
          else if isDarwin then
            import inputs.nixpkgs {
              inherit system;
              config = {
                allowUnfree = true; # for gh-copilot
              };
              overlays = [
                inputs.self.overlays.firge-nerd
              ];
            }
          else
            import inputs.nixpkgs {
              inherit system;
            };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          {
            # Home Manager version
            home.stateVersion = stateVersion;

            # User name
            home.username = username;

            # Environment variables
            home.sessionVariables = {
              inherit (env) EDITOR;
            };

            # Nix settings (that will generate ~/.config/nix/nix.conf)
            nix.package = pkgs.nix;

            # Let Home Manager install and manage itself.
            programs.home-manager.enable = true;
          }

          ./modules/file.nix
          ./modules/git.nix
          ./modules/direnv.nix

          inputs.self.homeModules.nvim-config
        ]
        ++ (
          # OS specific settings
          if isLinux then
            [
              {
                # Home directory
                home.homeDirectory = "/home/${username}";
              }
              ./modules/packages/linux.nix
            ]
          else if isDarwin then
            [
              {
                # Home directory
                home.homeDirectory = "Users/${username}";
              }
              ./modules/packages/darwin.nix
            ]
          else
            [ ] # unreachable
        );

        # Optionally use extraSpecialArgs
        # to pass through arguments to ./modules/*.nix
        extraSpecialArgs = {
          inherit (inputs) self;
          inherit env;
        };
      };
    };
}
