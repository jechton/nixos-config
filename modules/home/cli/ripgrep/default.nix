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
    "cli"
    "ripgrep"
  ];
  default = true;
  output = {programs.ripgrep.enable = true;};
}
