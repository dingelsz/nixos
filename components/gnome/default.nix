{ lib, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-software
    librewolf
    wofi
    emacs
  ];

  # Dconf Settings
  lib.hm.gvariant.dconf.settings = with lib.hm.gvariant; {
    "org/gnome/desktop/input-sources" = {
      current = mkUint32 0;
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "lv3:ralt_switch" "caps:ctrl_modifier" ];
    };
  };
}
