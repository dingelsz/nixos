{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    # Status Bars
    # ashell
    waybar

    # Launcher
    rofi

    # Wallpaper
    swaybg
  ];
}
