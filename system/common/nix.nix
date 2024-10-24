{ pkgs, ... }:

{
    nix = {
        useDaemon = true;

        settings = {
            substituters = [ "https://cache.nixos.org" ];
            auto-optimise-store = true;
        };

        gc = {
            automatic = true;
            options = "--delete-older-than 7d";
        };

        extraOptions = ''
            experimental-features   = nix-command flakes
            keep-outputs            = true
            keep-derivations        = true
        '';
    };

    nixpkgs.config.allowUnfree = true;
}