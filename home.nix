{ config, pkgs, ... }:

let
  const = import ./constants.nix;
in
{
 home.stateVersion = const.versions.home;
  
 home.username = const.username;
 home.homeDirectory = "/home/${const.username}";

 programs.home-manager.enable = true;
 }
