{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # KDE Packages
    kdePackages.kdeconnect-kde

    # Development Tools
    vim
    vscode
    gh
    git
    ctags

    # System Utilities
    tmux
    btop
    neofetch
    unzip
    wget

    # Terminals
    kitty

    # Applications
    spotify
    cava
    libreoffice-fresh
    google-chrome
    brave
    tor-browser
    steam
    thunderbird
    sniffnet

    # SDDM Catppuccin
    (catppuccin-sddm.override {
      flavor = "mocha";
      font  = "UbuntuSansMono NF Medium";
      fontSize = "12";
      background = "${./nixos.jpg}";
      loginBackground = true;
    })
    catppuccin-kde
    papirus-icon-theme
    bibata-cursors
  ];
}
