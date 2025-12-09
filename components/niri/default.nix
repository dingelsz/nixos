{ config, pkgs, ... }:

{
  programs.niri.enable = true;
  programs.waybar.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    # Status Bars
    waybar
    # Launcher
    rofi
    # Lockscreen
    swaylock
    # idle management
    swayidle
    # Wallpaper
    swaybg
  ];
  security.pam.services.swaylock = {};
}
