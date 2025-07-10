{
  lib,
  config,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = ["desktop"];
  default = true;
  output = {
    ${namespace}.desktop = {
      niri.enable = true;
    };
    programs.alacritty.enable = true;
  };
}
