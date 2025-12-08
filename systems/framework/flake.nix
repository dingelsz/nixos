{
 description = "test";

 inputs = {
   # Nixpkgs
   nixpkgs.url = "nixpkgs/master";
   
   # Home manager
   home-manager.url = "github:nix-community/home-manager/master";
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
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
   
   homeConfigurations = {
     user-host = home-manager.lib.homeManagerConfiguration {
       inherit pkg;
       modules = [./home.nix];      
     };
   };
 };
}
  
