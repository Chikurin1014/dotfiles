{ pkgs, ... }:

{
  home.packages =
    with pkgs;
    [
      # fonts
      moralerspace-hw
      # terminal emulator
      wezterm
      ghostty-bin # `ghostty` is Linux only
    ]
    ++ import ./_common.nix { inherit pkgs; };
}
