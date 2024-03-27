{config, pkgs, inputs,  ... }:
{
  # postgresql 
  services.postgresql = {
    enable = true;
    ensureUsers= [{ name = "rajdeepsingh";}];
    # ensureDatabases=["officialrajdeepsingh"];
    # authentication = pkgs.lib.mkOverride 10 ''
    # type database  DBuser  auth-method
    #  local all       all     trust
    # '';
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
      };
  };

}