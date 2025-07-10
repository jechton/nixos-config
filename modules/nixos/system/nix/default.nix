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
    "system"
    "nix"
  ];
  output = {
    environment.systemPackages = [
      pkgs.git
      pkgs.alejandra
    ];
    nix = {
      settings = {
        experimental-features = "nix-command flakes";
        builders-use-substitutes = true;
        trusted-users = ["jeremiah"];
        auto-optimise-store = true;

        substituters = [
          # high priority since it's almost always used
          "https://cache.nixos.org?priority=10"

          "https://chaotic-nyx.cachix.org/"
          "https://nix-community.cachix.org"
          "https://nix-gaming.cachix.org"
        ];

        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        ];
      };
      generateRegistryFromInputs = true;
      generateNixPathFromInputs = true;
      linkInputs = true;
      package = pkgs.lix;
    };
    system = {
      rebuild.enableNg = true;
    };
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/jeremiah/nixos-config";
    };
  };
}
