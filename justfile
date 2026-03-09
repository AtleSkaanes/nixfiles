home:
  nh home switch --backup-extension=hm_backup

os:
  nh os switch

fmt:
  nix fmt -- **/*.nix

update:
  nix flake update

clean:
  nh clean all --keep 5 --keep-since 7d
