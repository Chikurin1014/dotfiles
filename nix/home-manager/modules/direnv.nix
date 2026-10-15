{
  # Shell hook is configured in files/config/fish
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
