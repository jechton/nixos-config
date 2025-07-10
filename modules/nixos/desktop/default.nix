{
  lib,
  config,
  namespace,
  pkgs,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = ["desktop"];
  output = {
    programs.niri = {
      enable = true;
      package = pkgs.niri-stable;
    };
    niri-flake.cache.enable = true;

    services.xserver.enable = true;
  };
}
