{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blueman
  ];
}
