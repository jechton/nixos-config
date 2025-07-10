{
  lib,
  config,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = ["system"];
  default = true;
  output = {
    ${namespace}.system = {
      boot.enable = true;
      locale.enable = true;
      networking.enable = true;
      nix.enable = true;
      usb.enable = true;
    };

    programs.nix-ld.enable = true;

    services.xserver.enable = true;

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  };
}
