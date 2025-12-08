{
 description = "test";
 inputs.nixos-hardware.url = "github:NixOS/nixos-hardware/master";

 inputs = {
   # Nixpkgs
   nixpkgs.url = "nixpkgs/master";
 };
 
 outputs = {
   self,
     nixpkgs,
     nixos-hardware,
     ...
 } @ inputs: let
   const = import ./constants.nix;
   user-host = "${const.username}@${const.hostname}";
   pkg = nixpkgs.legacyPackages.${const.system};
 in {
   nixosConfigurations = {
     nixos = nixpkgs.lib.nixosSystem {
       system = const.system;
       specialArgs = {inherit inputs;};
       modules = [
         nixos-hardware.nixosModules.framework-13-7040-amd
         ./configuration.nix
       ];
     };
   };
 };
}
  
