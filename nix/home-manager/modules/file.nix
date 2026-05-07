{ self, ... }:
{
  home.file = {
    ".zshrc".source = self + "/files/zshrc";
    ".clang-format".source = self + "/files/clang-format";
    ".gitconfig".source = self + "/files/gitconfig";
    ".config" = {
      source = self + "/files/config";
      recursive = true;
    };
  };
}
