{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
    ];

    #
    # System Configuration
    #
    system.stateVersion = "24.11";

    # Bootloader
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Time and Locale
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

    #
    # Networking
    #
    networking = {
        hostName = "NixOS";
        networkmanager.enable = true;
        nameservers = [
            "1.1.1.1"
            "1.0.0.1"
        ];
        # wireless.enable = true;
        # proxy = {
        #     default = "http://user:password@proxy:port/";
        #     noProxy = "127.0.0.1,localhost,internal.domain";
        # };
    };

    #
    # Desktop Environment
    #
    services.xserver.enable = false;
    services.desktopManager.plasma6.enable = true;

    services.displayManager = {
        sddm.enable = true;
        autoLogin = {
            enable = true;
            user = "farhnkrnapratma";
        };
    };

    #
    # Audio
    #
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa = {
            enable = true;
            support32Bit = true;
        };
        pulse.enable = true;
        # jack.enable = true;
        # media-session.enable = true;
    };

    #
    # User Management
    #
    users.users.farhnkrnapratma = {
        isNormalUser = true;
        description = "Farhan Kurnia Pratama";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    #
    # System Packages
    #
    nixpkgs.config.allowUnfree = true;

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
  	plasma-browser-integration
  	konsole
	oxygen
	kate
	elisa
	khelpcenter
	kcrash
	kcharselect
	ark
	drkonqi
    ];

    environment.systemPackages = with pkgs; [
        # Development Tools
        vim
	neovim
	helix
        gh
        git
	docker
	poetry
	ctags

        # System Utilities
        tmux
	btop
	neofetch
	pfetch-rs
	unzip

        # Terminals
        alacritty

        # Applications
        spotify
        cava
	libreoffice-fresh
	kdePackages.kdeconnect-kde

	# Development
	python3Full
	rustup	
	gcc
    ];

    #
    # Fonts
    #
    fonts.packages = with pkgs; [
        ubuntu-sans
        ubuntu-sans-mono
        nerdfonts
    ];

    #
    # Programs
    #
    programs.kdeconnect.enable = true;
    programs.firefox.enable = true;
    #
    # Services
    #
    services.printing.enable = true;

    # Optional Services
    # services.xserver.libinput.enable = true;
    # services.openssh.enable = true;
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #     enable = true;
    #     enableSSHSupport = true;
    # };
    # networking.firewall = {
    #     allowedTCPPorts = [ ... ];
    #     allowedUDPPorts = [ ... ];
    #     enable = true;
    # };
}
