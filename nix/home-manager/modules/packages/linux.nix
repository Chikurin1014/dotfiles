{ pkgs, ... }:

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
      wezterm
      ghostty
    ]
    ++ import ./_common.nix { inherit pkgs; };
}
