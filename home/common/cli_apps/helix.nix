{ pkgs, ... }:

{
    home.packages = [ pkgs.helix ];
    programs.helix = {
        enable = true;
        defaultEditor = true;
        settings = {
            theme = "catppuccin_mocha_transparent";
            editor.cursor-shape = {
              normal = "block";
              insert = "bar";
              select = "underline";
            };
            editor = {
                line-number = "relative";
                lsp.display-messages = true;
            };
        };
        languages.language = [
            {
                name = "nix";
                auto-format = true;
                formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
            }
        ];
        themes = {
            catppuccin_mocha_transparent = {
                "inherits" = "catppuccin_mocha";
                "ui.background" = { };
            };
        };
    };
}