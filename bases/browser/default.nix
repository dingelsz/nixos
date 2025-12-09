{ config, pkgs, ... }:


let
   browser-desktop = pkgs.makeDesktopItem
   {
     name = "browser";
     desktopName = "browser";
     exec = "libreworld";
     icon = "browser";
   };
in
{
 environment.systemPackages = with pkgs;
 [
   # brave
   # firefox
  librewolf
  browser-desktop
  ];
 }
