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
      loader.grub = {
        enable = true;
        device = "/dev/vda";
        useOSProber = true;
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
