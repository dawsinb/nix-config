{ pkgs, ... }:

{
    programs.home-manager.enable = true;
    home.stateVersion = "23.11";
    home.packages = with pkgs; [
        (nerdfonts.override {
            fonts = [
                "FiraCode"
                "JetBrainsMono"
            ];
        })

        slack
    ];

    # colorScheme = inputs.nix-colors.colorSchemes.catppuccin_mocha;

    imports = [
        ./terminal
        ./cli_apps
        ./gui_apps
    ];
}