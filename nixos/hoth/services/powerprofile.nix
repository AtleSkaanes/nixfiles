{
  powerManagement = {
    enable = true;
    powertop.enable = true;
    # cpuFreqGovernor = "schedutil"; #power, performance, ondemand
  };

  services.power-profiles-daemon.enable = true; # ppd, not default
}
