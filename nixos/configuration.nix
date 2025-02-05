{ config, ... }:

{
  system.stateVersion = "24.11";
  nix.settings.experimental-features =  ["nix-command" "flakes"];
  
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./desktop.nix
    ./exclude.nix
    ./fonts.nix
    ./hardware.nix
    ./locale.nix
    ./networking.nix
    ./nixld.nix
    ./optional.nix
    ./packages.nix
    ./sddm.nix
    ./security.nix
    ./user.nix
  ];
}
