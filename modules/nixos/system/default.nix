{
  lib,
  config,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in
  lib.${namespace}.mkModule {
    inherit config;
    path = ["system"];
    default = true;
    output = {
      ${namespace}.system = {
        audio = enabled;
        boot = enabled;
        locale = enabled;
        networking = enabled;
        nix = enabled;
        usb = enabled;
      };

      programs.nix-ld.enabled = true;

      services = {
        xserver.enabled = true;

        displayManager.gdm.enabled = true;
        desktopManager.gnome.enabled = true;
      };
    };
  }
