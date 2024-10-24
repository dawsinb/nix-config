colors:

{
    settings = {
        directory = {
            style = "fg:${colors.fg} bg:${colors.bg}";
            format = "[ $path ]($style)";
            truncation_length = 3;
            truncation_symbol = "…/";
            substitutions = {
                "Documents" = "󰈙 ";
                "Downloads" = " ";
                "Music" = " ";
                "Pictures" = " ";
            };
        };
    };

    formatString = "$directory";
}