{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in
  lib.${namespace}.mkModule {
    inherit config;
    path = [
      "suites"
      "common"
    ];
    output = {
      ${namespace} = {
        services.ssh = enabled;
        desktop = enabled;
      };
    };
  }
