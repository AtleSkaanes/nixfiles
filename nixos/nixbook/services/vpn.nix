{
  services.openvpn = {
    servers = {
      dk  = {
        authUserPass = "/home/atle/.config/nixos/.secrets/pia_creds.txt";
        config = '' config /etc/openvpn/dk_copenhagen.ovpn '';
        updateResolvConf = true;
        autoStart = false;
      };
      dk_stream = {
        authUserPass =  "/home/atle/.config/nixos/.secrets/pia_creds.txt";
        # authUserPass =  ../../../.secrets/pia_creds.txt;
        config = '' config /etc/openvpn/dk_streaming_optimized.ovpn '';
        updateResolvConf = true;
        autoStart = false;
      };
    };
  };
}
