{ pkgs, lib, ... }:

let
    palette = import ./palette.nix;
    directory = import ./directory.nix { fg = "base"; bg = "yellow"; };
    git = import ./git.nix { fg = "base"; bg = "teal"; };
    languages = import ./languages.nix { fg = "base"; bg = "sapphire"; };
    time = import ./time.nix { fg = "base"; bg = "lavender"; };
in
{
    home.packages = [ pkgs.starship ];
    programs.starship = {
        enable = true;
        enableZshIntegration = true;

        settings = {
            add_newline = true;
            follow_symlinks = true;
            command_timeout = 99999999999;

            format = lib.concatStrings [
                "[░▒▓](peach)"
                "[  ](fg:base bg:peach)"
                "[](fg:peach bg:yellow)"
                directory.formatString
                "[](fg:yellow bg:teal)"
                git.formatString
                "[](fg:teal bg:sapphire)"
                languages.formatString
                "[](fg:sapphire bg:lavender)"
                time.formatString
                "[ ](fg:lavender)"
                "\n$character"
            ];

            
        }
        // palette
        // directory.settings
        // git.settings
        // languages.settings
        // time.settings;
    };
}