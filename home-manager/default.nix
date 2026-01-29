{
  env,
  nixgl,
  ...
}@extraArgs:

{
  lib,
  config,
  pkgs,
  ...
}@inputs:

import ./home.nix (extraArgs // inputs)
