{ pkgs, ... }:
{

  networking = {
    hostName = "nixbook"; # Define your hostname.
    firewall = {
      checkReversePath = "loose";
      # Open ports in the firewall.
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # enable = false;
    };

    # Enable networking
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
  };

  networking.resolvconf.enable = true;
  # services.resolved.enable = true;
}
