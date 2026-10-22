{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zig_0_17
    zigscient
    zigStdenv
  ];
}
