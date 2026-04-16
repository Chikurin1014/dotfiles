{
  file = {
    ".zshrc".source = ../files/zshrc;
    ".clang-format".source = ../files/clang-format;
    ".gitconfig".source = ../files/gitconfig;
    ".config" = {
      source = ../files/config;
      recursive = true;
    };
  };
}
