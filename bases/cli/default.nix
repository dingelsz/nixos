{ lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.just
  ];
}
