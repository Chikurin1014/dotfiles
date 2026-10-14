{ self, ... }:
{
  # Enable the ssh-agent user unit deployed from files/config/systemd/user
  # (equivalent to `systemctl --user enable ssh-agent`)
  home.file.".config/systemd/user/default.target.wants/ssh-agent.service".source =
    self + "/files/config/systemd/user/ssh-agent.service";
}
