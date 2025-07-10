{
  config,
  lib,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = ["home"];
  default = true;
  output = {
    manual = {
      html.enable = false;
      json.enable = false;
      manpages.enable = false;
    };
  };
}
