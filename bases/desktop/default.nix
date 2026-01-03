{ config, pkgs, ... }:
{
 imports = [
   # Window manager
   ../../components/hyprland
   # ../../components/niri
   # ../../components/kde
   # ../../components/gnome
   # Apps
   ../../components/emacs
   # 
   
  ];
   environment.systemPackages = [
     pkgs.brightnessctl
  ];
 }
