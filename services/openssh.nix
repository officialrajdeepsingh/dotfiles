{config, pkgs, inputs,  ... }:
{

  # Enable the OpenSSH daemon.
  
  services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
      };
  };

}