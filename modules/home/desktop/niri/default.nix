{
  config,
  lib,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "desktop"
    "niri"
  ];
  output = {
    # programs.niri = {
    #   settings = {
    #     environment = {
    #       NIXOS_OZONE_WL = "1";
    #       SDL_VIDEODRIVER = "wayland";
    #     };
    # input = {
    #   keyboard = {
    #     xkb = {
    #       layout = "us";
    #     };
    #   };
    #   mouse = {
    #     accel-profile = "flat";
    #   };
    #   focus-follows-mouse.enable = true;
    # };
    # };
    # };
  };
}
