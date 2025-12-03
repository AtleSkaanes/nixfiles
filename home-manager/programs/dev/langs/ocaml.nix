{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ocaml
    ocamlformat
    ocamlPackages.ocaml-lsp
    dune_3
    opam
  ];
}
