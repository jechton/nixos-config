{
  config,
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
  output = {programs.ripgrep.enable = true;};
}
