{ pkgs, ... }:

{
    home.packages = [ pkgs.eza ];
    programs.eza = {
        enable = true;
        git = true;
        icons = "always";
        extraOptions = [
            "--group-directories-first"
        ];
    };
    programs.zsh.shellAliases = {
        lg = "lazygit";
    };
}