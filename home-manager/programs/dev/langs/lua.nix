{ pkgs, ... }:
{
  home.packages = [ pkgs.luajitPackages.lua-lsp ];
}
