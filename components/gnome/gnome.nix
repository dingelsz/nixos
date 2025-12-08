{ lib, ... }:

with lib.hm.gvariant;
{

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      current = mkUint32 0;
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "lv3:ralt_switch" "caps:ctrl_modifier" ];
    };
  };

}