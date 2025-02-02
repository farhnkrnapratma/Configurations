{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system-packages.nix
    ./excluded-packages.nix
    ./user-configuration.nix
    ./security-configuration.nix
    ./networking-configuration.nix
    ./audio-configuration.nix
  ];

  # System Configuration
  system.stateVersion = "24.11";

  # Bootloader Configuration
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Time and Locale Configuration
  time.timeZone = "Asia/Jakarta";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "id_ID.UTF-8";
      LC_IDENTIFICATION = "id_ID.UTF-8";
      LC_MEASUREMENT = "id_ID.UTF-8";
      LC_MONETARY = "id_ID.UTF-8";
      LC_NAME = "id_ID.UTF-8";
      LC_NUMERIC = "id_ID.UTF-8";
      LC_PAPER = "id_ID.UTF-8";
      LC_TELEPHONE = "id_ID.UTF-8";
      LC_TIME = "id_ID.UTF-8";
    };
  };

  # Desktop Environment Configuration
  services.desktopManager.plasma6.enable = true;
  services.displayManager = {
    sddm = {
      enable = true;
      theme = "catppuccin-mocha";
    };
  };

  # Allow Unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "UbuntuSans" "UbuntuMono" ]; })
  ];

  # Programs
  programs.steam.enable = true;
  programs.kdeconnect.enable = true;
  programs.firefox.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Services
  services.printing.enable = true;
  services.openssh.enable = true;
}
