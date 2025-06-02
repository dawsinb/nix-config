{ pkgs, ... }:

{
    fontconfig.enable = true;
    fonts.packages = with pkgs; [
        dejavu_fonts
        nerdfonts.jet-brains-mono
        nerdonts.fira-code
    ];
}