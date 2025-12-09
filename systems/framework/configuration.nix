{ config, pkgs, ... }:

let
  hostname    = "nixos";
  username    = "zach";
  timezone    = "America/Los_Angeles";
  locale      = "en_US.UTF-8";
  versions    = {
    nix  = "25.11";
    home = "25.11";
  };
in
{

 # Bootloader.
 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;

 # Networking
 networking.hostName = hostname;
 networking.networkmanager.enable = true;

 # Timezone
 time.timeZone = timezone;

 # Internationalisation
 i18n.defaultLocale = locale;
 i18n.extraLocaleSettings = {
   LC_ADDRESS        = locale;
   LC_IDENTIFICATION = locale;
   LC_MEASUREMENT    = locale;
   LC_MONETARY       = locale;
   LC_NAME           = locale;
   LC_NUMERIC        = locale;
   LC_PAPER          = locale;
   LC_TELEPHONE      = locale;
   LC_TIME           = locale;
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
 users.users.${username} = {
   isNormalUser = true;
   description = username;
   extraGroups = [ "networkmanager" "wheel" ];
   packages = with pkgs; [
   ];
 };

 # Allow unfree packages
 nixpkgs.config.allowUnfree = true;
 environment.systemPackages = with pkgs; [
   git
   emacs-nox
 ];

 system.stateVersion = versions.nix;
 nix.settings.experimental-features = ["nix-command" "flakes"];
}
