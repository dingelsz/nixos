{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python311.withPackages (ps: with ps; [
      numpy # these two are
      pandas
      scipy # probably redundant to pandas
      jupyterlab
      pandas
      scikitlearn
    ]))];
}


