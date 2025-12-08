{
 description = "test";

 inputs = {
   # Nixpkgs
   nixpkgs.url = "nixpkgs/master";

 };
 
 outputs = {
   self,
     nixpkgs,
     home-manager,
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
       modules = [./configuration.nix];
     };
   };
 };
}
  
