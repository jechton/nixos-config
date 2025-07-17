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
    "sway"
  ];
  output = {
    wayland.windowManager.sway = {
      enable = true;
    };
  };
}
