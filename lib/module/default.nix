{
  lib,
  namespace,
  ...
}:
with lib;
# Yoinked from https://git.gay/olivia/fur/src/branch/main/lib/module/default.nix
  rec {
    ## Create a NixOS module option.
    ##
    ## ```nix
    ## lib.mkOpt nixpkgs.lib.types.str "My default" "Description of my option."
    ## ```
    ##
    #@ Type -> Any -> String
    mkOpt = type: default: description:
      mkOption {inherit type default description;};

    ## Create a NixOS module option without a description.
    ##
    ## ```nix
    ## lib.mkOpt' nixpkgs.lib.types.str "My default"
    ## ```
    ##
    #@ Type -> Any -> String
    mkOpt' = type: default: mkOpt type default null;

    ## Create a boolean NixOS module option.
    ##
    ## ```nix
    ## lib.mkBoolOpt true "Description of my option."
    ## ```
    ##
    #@ Type -> Any -> String
    mkBoolOpt = mkOpt types.bool;

    ## Create a boolean NixOS module option without a description.
    ##
    ## ```nix
    ## lib.mkBoolOpt true
    ## ```
    ##
    #@ Type -> Any -> String
    mkBoolOpt' = mkOpt' types.bool;

    enabled = {
      ## Quickly enable an option.
      ##
      ## ```nix
      ## services.nginx = enabled;
      ## ```
      ##
      #@ true
      enable = true;
    };

    disabled = {
      ## Quickly disable an option.
      ##
      ## ```nix
      ## services.nginx = enabled;
      ## ```
      ##
      #@ false
      enable = false;
    };

    # thanks marsh
    mkModule = {
      config,
      path,
      output,
      default ? false,
      extraOptions ? {},
    }: let
      realPath = [namespace] ++ path;
      mergedOptions = lib.mergeAttrs {enable = mkBoolOpt' default;} extraOptions;
    in {
      options = lib.setAttrByPath realPath mergedOptions;
      config = lib.mkIf (lib.attrByPath (realPath ++ ["enable"]) false config) output;
    };
  }
