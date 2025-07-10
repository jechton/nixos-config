{
  config,
  lib,
  pkgs,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in
  lib.${namespace}.mkModule {
    inherit config;
    path = [
      "cli"
    ];
    extraOptions = {
      shell =
        lib.${namespace}.mkOpt' (lib.types.enum [
          pkgs.fish.meta.mainProgram
          pkgs.nushell.meta.mainProgram
        ])
        pkgs.fish.meta.mainProgram;
    };
    default = true;
    output = {
      ${namespace}.cli = {
        fish = enabled;
        git = enabled;
        helix = enabled;
        jj = enabled;
        starship = enabled;
      };

      home.packages = with pkgs; [
        # archives
        zip
        unzip
        unrar
        p7zip

        file
        dust
      ];
    };
  }
