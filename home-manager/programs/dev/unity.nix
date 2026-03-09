{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    unityhub
    inputs.KneeCapStealer.packages.x86_64-linux.nvim-unity
    dotnet-sdk_10
    omnisharp-roslyn
];
}
