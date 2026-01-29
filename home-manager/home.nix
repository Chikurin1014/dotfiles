{
  env,
  lib,
  config,
  pkgs,
  nixgl,
  ...
}@inputs:

let
  home = import ./home inputs;
in
{
  # Inherit home configuration
  inherit home;

  # Nix settings (that will generate ~/.config/nix/nix.conf)
  nix = {
    package = pkgs.nix;
  };

  programs = {
    zsh = {
      enable = true;
      sessionVariables = {
        inherit (env) EDITOR;
      };
    };
    git = {
      enable = true;
      extraConfig = {
        user = {
          name = env.GIT_USER_NAME;
          email = env.GIT_USER_EMAIL;
        };
        core.editor = env.EDITOR;
      };
    };
  };

  nixGL.packages = import nixgl {
    inherit pkgs;
  };
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = [ "mesa" ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
