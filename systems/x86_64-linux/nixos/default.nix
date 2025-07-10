{
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in {
  imports = [./hardware.nix];

  networking.hostName = "nixos";

  ${namespace} = {
    suites.common = enabled;
  };

  # DO NOT CHANGE THIS
  system.stateVersion = "25.05";
}
