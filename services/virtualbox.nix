{

  # Enable the OpenSSH daemon.
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "officialrajdeepsingh" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

}
