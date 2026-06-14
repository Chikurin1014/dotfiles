{ pkgs, ... }:

{
  home.packages =
    with pkgs;
    [
      # fonts
      moralerspace-hw
      # terminal emulator
      wezterm
      ghostty
    ]
    ++ import ./_common.nix { inherit pkgs; };
}
