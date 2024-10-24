colors:

{
    settings = {
        git_branch = {
            symbol = "";
            style = "bg:${colors.bg}";
            format = "[[ $symbol $branch ](fg:${colors.fg} bg:${colors.bg})]($style)";
        };

        git_status = {
            style = "bg:${colors.bg}";
            format = "[[($all_status$ahead_behind )](fg:${colors.fg} bg:${colors.bg})]($style)";
        };
    };

    formatString = "$git_branch$git_status";
}