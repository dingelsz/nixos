{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    ashell # status bar
    rofi
  ];
}
