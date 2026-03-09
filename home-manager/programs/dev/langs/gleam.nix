{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gleam
    glas
    erlang
  ];
}
