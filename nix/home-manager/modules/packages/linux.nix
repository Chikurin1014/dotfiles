{ config, pkgs, ... }:

let
  # Wrap GUI applications with nixGL on non-NixOS systems (no-op on NixOS)
  wrapGL = config.lib.nixGL.wrap;
in
{
  home.packages =
    with pkgs;
    [
      # japanese input system
      ibus-engines.mozc
      # fonts
      firge-nerd
      moralerspace-hw
      # terminal emulator
      (wrapGL wezterm)
      (wrapGL ghostty)
    ]
    ++ import ./_common.nix { inherit pkgs wrapGL; };
}
