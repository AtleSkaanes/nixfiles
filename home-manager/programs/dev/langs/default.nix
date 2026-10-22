{ pkgs, ... }:
{
  imports = [
    ./c-cpp.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
    ./zig.nix
    ./lua.nix
    ./ocaml.nix
  ];

  home.packages = with pkgs; [
    jdt-language-server
  ];
}
