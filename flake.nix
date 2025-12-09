{
 description = "A framework system";
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
   system = "x86_64-linux";
   pkg = nixpkgs.legacyPackages.${system};
 in {
   nixosConfigurations = {
     nixos = nixpkgs.lib.nixosSystem {
       specialArgs = {inherit inputs;};
       modules = [
         nixos-hardware.nixosModules.framework-13-7040-amd
         ./systems/framework/configuration.nix
         ./systems/framework/hardware-configuration.nix
         ./bases/bluetooth
         ./bases/browser
         ./bases/cli
         ./bases/desktop
         ./bases/dev
         ./bases/file-manager
         ./bases/fonts
         ./bases/keyboard
         ./bases/terminal
         ./components/flatpak
         ./components/distrobox
         ./components/obsidian
       ];
     };
   };
 };
}
  
