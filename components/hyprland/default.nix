{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    hypr    
    waybar       # status bar
    rofi         # launcher
    swaybg       # wallpaper
    apple-cursor # cursor
    hypridle     # idle manager
    hyprlock     # lockscreen
  ];
}
