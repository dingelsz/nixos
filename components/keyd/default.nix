{ config, pkgs, ... }:

{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
	      settings = {
	        main = {
	          capslock = "layer(control)";
	          leftalt = "leftmeta";
	          leftmeta = "leftalt";
	        };
	      };
      };
    };
  };
}
