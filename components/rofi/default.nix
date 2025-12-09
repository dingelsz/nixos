{ pkgs, ...}:

let
   desktop-lock = pkgs.makeDesktopItem
   {
     name = "Power: Lock";
     desktopName = "Power: Lock";
     exec = "hyprlock";
   };
   desktop-logout = pkgs.makeDesktopItem
   {
     name = "Power: Logout";
     desktopName = "Power: Logout";
     exec = "hyprctl dispatch exit";
   };
   desktop-reboot = pkgs.makeDesktopItem
   {
     name = "Power: Reboot";
     desktopName = "Power: Reboot";
     exec = "reboot";
   };
   desktop-shutdown = pkgs.makeDesktopItem
   {
     name = "Power: Off";
     desktopName = "Power: Off";
     exec = "shutdown now";
   };
in
{
  environment.systemPackages = with pkgs; [
    rofi
    desktop-lock
    desktop-logout
    desktop-reboot
    desktop-shutdown
  ];
}
