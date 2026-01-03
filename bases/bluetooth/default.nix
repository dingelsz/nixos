{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blueman
  ];

  hardware.bluetooth.enable = true;
  
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;
}
