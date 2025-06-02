{ pkgs, ... }:

{
    programs.home-manager.enable = true;
    home.stateVersion = "23.11";
    home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.fira-code
    ];

    # colorScheme = inputs.nix-colors.colorSchemes.catppuccin_mocha;

    imports = [
        ./terminal
        ./cli_apps
        ./gui_apps
    ];
}