{ config, pkgs, ... }:

let
  const = import ./constants.nix;
in
{
 imports = [
   ./hardware-configuration.nix
  ../../bases/window_manager
  # ../../bases/keyboard
 ];

 # Bootloader.
 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;

 # Networking
 networking.hostName = "nixos"; # Define your hostname.
 networking.networkmanager.enable = true;

 # Timezone
 time.timeZone = const.timezone;

 # Internationalisation
 i18n.defaultLocale = const.locale;
 i18n.extraLocaleSettings = {
   LC_ADDRESS        = const.locale;
   LC_IDENTIFICATION = const.locale;
   LC_MEASUREMENT    = const.locale;
   LC_MONETARY       = const.locale;
   LC_NAME           = const.locale;
   LC_NUMERIC        = const.locale;
   LC_PAPER          = const.locale;
   LC_TELEPHONE      = const.locale;
   LC_TIME           = const.locale;
 };

 # Enable the X11 windowing system.
 services.xserver.enable = true;

 # Configure keymap in X11
 services.xserver.xkb = {
   layout = "us";
   variant = "";
 };

 # Enable CUPS to print documents.
 services.printing.enable = true;

 # Audio
 services.pulseaudio.enable = false;
 security.rtkit.enable = true;
 services.pipewire = {
   enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
   pulse.enable = true;
 };

 # Define a user account. Don't forget to set a password with ‘passwd’.
 users.users.${const.username} = {
   isNormalUser = true;
   description = const.username;
   extraGroups = [ "networkmanager" "wheel" ];
   packages = with pkgs; [
   ];
 };

 # Install firefox.
 programs.firefox.enable = true;

 # Allow unfree packages
 nixpkgs.config.allowUnfree = true;

 environment.systemPackages = with pkgs; [
   git
   emacs-nox
 ];

 system.stateVersion = const.versions.nix;
 nix.settings.experimental-features = ["nix-command" "flakes"];
}
