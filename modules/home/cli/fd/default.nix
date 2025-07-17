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
  output = {programs.fd.enable = true;};
}
