{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # KDE Packages
    kdePackages.kcolorchooser

    # Development Tools
    vim
    vscode
    jetbrains-toolbox
    gh
    git

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

    # Appearance
    (catppuccin-sddm.override {
      flavor = "mocha";
      font  = "UbuntuSansMono NF Medium";
      fontSize = "12";
      background = "${./Mountain_Desktop_8.png}";
      loginBackground = true;
    })
    catppuccin-kde
    papirus-icon-theme
    bibata-cursors
  ];
}
