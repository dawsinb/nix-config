{ pkgs, ... }:

{
    fontconfig.enable = true;
    fonts.packages = with pkgs; [
        dejavu_fonts
        (nerdfonts.override {
            fonts = [
                "FiraCode"
            ];
        })
    ];
}