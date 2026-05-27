{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dolphin-emu # Wii, GameCube
    eden # Nintendo Switch
  ];
}
