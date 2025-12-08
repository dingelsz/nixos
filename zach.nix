{ config, pkgs, ... }:

{
  
  # Packages
  home.packages = with pkgs; [
    hello
    swaybg
  ];

  imports = [
    ./rofi.nix
  ];

  # Move the hyprland config
  home.file.".config/hypr/hyprland.conf" = {
    source = ./hyprland.conf;
  };
}
