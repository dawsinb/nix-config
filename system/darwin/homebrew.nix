{ pkgs, inputs, host, ... }:

{
    nix-homebrew = {
        enable = true;
        user = host.user;
        taps = {
            "homebrew/homebrew-core" = inputs.homebrew-core;
            "homebrew/homebrew-cask" = inputs.homebrew-cask;
        };
        mutableTaps = false;
        autoMigrate = true;
        enableRosetta = true;
    };
}