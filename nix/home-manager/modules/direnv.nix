{
  # Shell hooks are configured in files/config/{fish,zsh}
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
