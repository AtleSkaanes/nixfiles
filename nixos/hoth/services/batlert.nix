{ inputs, ... }: 
{
  imports = [
    inputs.batlert.nixosModules.default
  ];

  services.batlert = {
    enable = true;
    batteryPct = 5;
    interval = 120;
  };
}
