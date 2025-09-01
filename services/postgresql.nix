{
  services.postgresql = {
    enable = true;
    ensureUsers = [ { name = "rajdeepsingh"; } ];
    # ensureDatabases=["officialrajdeepsingh"];
    # authentication = pkgs.lib.mkOverride 10 ''
    # type database  DBuser  auth-method
    #  local all       all     trust
    # '';
  };
}
