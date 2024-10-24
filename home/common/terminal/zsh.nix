{ pkgs, ... }:

{
    home.packages = [ pkgs.zsh ];
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
    };
}