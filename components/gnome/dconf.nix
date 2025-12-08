{ lib, ... }:

with lib.hm.gvariant;
{
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      current = mkUint32 0;
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "lv3:ralt_switch" "caps:ctrl_modifier" ];
    };
  };

}