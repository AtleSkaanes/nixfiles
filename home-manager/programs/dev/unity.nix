{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    unityhub
    dotnet-sdk_10
    omnisharp-roslyn
];
}
