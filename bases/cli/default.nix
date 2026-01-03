{ lib, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.just
    pkgs.psmisc
  ];
}
