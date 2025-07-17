{
  config,
  pkgs,
  lib,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "system"
    "boot"
  ];
  output = {
    boot = {
      loader = {
        systemd-boot = {
          enable = true;
          editor = lib.mkDefault false;
          configurationLimit = 5;
        };
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
      kernelParams = [
        "quiet"
        "systemd.show_status=auto"
        "rd.udev.log_level-3"
        "plymouth.use-simpledrm"
      ];
      plymouth.enable = true;

      tmp = {
        useTmpfs = true;
        cleanOnBoot = true;
      };
    };
    systemd.services.nix-daemon = {
      environment = {
        TMPDIR = "/var/tmp";
      };
    };
  };
}
