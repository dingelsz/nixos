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
    adw-bluetooth   # Bluetooth Manager
        adwaita-icon-theme # dependency
    bluetui
        nmgui        # WiFi/Network Manager
  ];
}
