{ config, pkgs, ... }:

{
  networking = {
    hostName = "NixOS";
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
}
