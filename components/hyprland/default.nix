{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };
  imports = [
    ../rofi # launcher
  ];
  # Packages
  environment.systemPackages = with pkgs; [
    hypr    
    waybar       # status bar
    swaybg       # wallpaper
    apple-cursor # cursor
    hyprlock     # lockscreen
  ];
}
