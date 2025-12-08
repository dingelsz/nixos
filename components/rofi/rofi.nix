{
  config,
  ...
}: {
    programs.rofi = {
      enable = true;
    };

    programs.rofi.theme = "~/.config/rofi/theme.rasi";


    # home.file.".config/rofi/config.rasi" = {
    #   text = ''
    #     @theme "/home/zach/.config/rofi/theme.rasi"
    #   '';
    # };

    home.file.".config/rofi/theme.rasi" = {
      source = ./theme.rasi;
    };

    home.file.".config/hypr/per-app/rofi.conf" = {
      text = ''
	bind = $mainMod, SPACE, exec, rofi -show drun -show-icons
      '';
    };
}
