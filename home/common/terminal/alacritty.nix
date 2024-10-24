{ pkgs, ... }:

{
    home.packages = [ pkgs.alacritty ];
    programs.alacritty = {
        enable = true;

        settings = {
            font = {
                # normal.family = "FiraCode Nerd Font Mono";
                normal.family = "JetBrainsMono Nerd Font";
                size = 14.0;
            };

            window = {
                decorations = "Buttonless";
                opacity = 0.75;
                blur = true;
            };
        };
    };
}