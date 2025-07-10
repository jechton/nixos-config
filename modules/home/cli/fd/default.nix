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
    "fd"
  ];
  default = true;
  output = {programs.fd.enable = true;};
}
