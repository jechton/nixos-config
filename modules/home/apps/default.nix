{
  lib,
  config,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in
  lib.${namespace}.mkModule {
    inherit config;
    path = ["apps"];
    default = true;
    output = {
      ${namespace}.apps = {
        ghostty = enabled;
        zed = enabled;
      };
    };
  }
