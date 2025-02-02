{ pkgs, ... }:

{
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
    oxygen-icons
    kate
    elisa
    khelpcenter
    kcrash
    kcharselect
    ark
    drkonqi
    xwaylandvideobridge
    ktexteditor
    kuserfeedback
  ];
}
