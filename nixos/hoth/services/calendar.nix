{
  programs.evolution.enable = true;
  programs.dconf.enable = true;
  services.gnome.evolution-data-server.enable = true;

  # optional to use google/nextcloud calendar
  services.gnome.gnome-online-accounts.enable = true;
}
