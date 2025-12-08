{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  
  home.username = "zach";
  home.homeDirectory = "/home/zach";

  programs.home-manager.enable = true;
}
