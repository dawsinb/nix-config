{ pkgs, ... }:

{
    home.packages = [ pkgs.eza ];
    programs.eza = {
        enable = true;
        icons = true;
        git = true;
        extraOptions = [
            "--group-directories-first"
        ];
    };
    programs.zsh.shellAliases = {
        lg = "lazygit";
    };
}