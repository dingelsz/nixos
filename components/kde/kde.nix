{ config, pkgs, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    xserver.xkbOptions = "ctrl:swapcaps";
  };

  
  environment.systemPackages = with pkgs;
    [
      # KDE
      kdePackages.kcalc # Calculator
      kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
      kdePackages.kcolorchooser # A small utility to select a color
      kdePackages.sddm-kcm # Configuration module for SDDM
      kdiff3 # Compares and merges 2 or 3 files or directories
      hardinfo2 # System information and benchmarks for Linux systems
      vlc # Cross-platform media player and streaming server
      wayland-utils # Wayland utilities
      wl-clipboard # Command-line copy/paste utilities for Wayland
    ];
}