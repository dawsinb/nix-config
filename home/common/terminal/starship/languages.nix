colors:

let
    style = "bg:${colors.bg}";
    format = "[[ $symbol ($version) ](fg:${colors.fg} bg:${colors.bg})]($style)"; 
in
{
    settings = {
        rust.symbol = "";
        rust = { inherit style; inherit format; }; 
    
        nodejs.symbol = "";
        nodejs = { inherit style; inherit format; };
    };

    formatString = "$rust$nodejs";
}