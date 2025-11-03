{
  services.keyd = {
    enable = true;
    keyboards = {
      # The name is just the name of the configuration file, it does not really matter
      default = {
        ids = [ "*" ]; # what goes into the [id] section, here we select all keyboards
        # Everything but the ID section:
        # settings = {
        #   # The main layer, if you choose to declare it in Nix
        #   main = {
        #     capslock = "esc";
        #     alt = "layer(alt_layer)";
        #   };
        #   alt_layer = {
        #     capslock = "capslock";
        #   };
        # };
        extraConfig = ''
          [main]
          capslock = esc
          alt = layer(alt_layer)

          [alt_layer:A]
          capslock = capslock
        '';
      };
    };
  };

}
