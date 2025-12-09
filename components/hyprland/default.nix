{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    # Status Bars
    waybar
    # Launcher
    rofi
    # Wallpaper
    swaybg
    # Cursor
    apple-cursor
  ];
}
