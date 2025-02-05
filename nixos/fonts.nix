{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "UbuntuSans" "UbuntuMono" ]; })
    cantarell-fonts
  ];
}