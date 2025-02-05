{ ... }:

{
  programs.kdeconnect.enable = true;
  programs.firefox.enable = true;
  services.printing.enable = true;
  services.openssh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}