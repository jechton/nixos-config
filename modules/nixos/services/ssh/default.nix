{
  options,
  config,
  lib,
  namespace,
  ...
}:
lib.${namespace}.mkModule {
  inherit config;
  path = [
    "services"
    "ssh"
  ];
  output = {
    services.openssh = {
      enable = true;
      ports = [22];
    };

    # TODO: Store publicKey
  };
}
