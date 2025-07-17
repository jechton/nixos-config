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
      sway.enable = true;
    };
    programs.alacritty.enable = true;
  };
}
