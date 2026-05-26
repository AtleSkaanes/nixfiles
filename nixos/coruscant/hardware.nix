{ pkgs, ... }:
{
  hardware.xone.enable = true;
  hardware.logitech.wireless.enable = true;

  services.xserver.videoDrivers = [ "modesetting" ];

  hardware = {
    enableAllFirmware = true;
    enableAllHardware = true;
    enableRedistributableFirmware = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Fixes compatibility and handshake issues common to the MT7922
        ControllerMode = "bredr"; 
        Experimental = true;
      };
    };
  };
}
