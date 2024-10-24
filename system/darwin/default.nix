{ pkgs, inputs, ... }:

{
    system.stateVersion = 5;
    programs.zsh.enable = true;
    ids.uids.nixbld = 300;
    imports = [
        ./home-manager.nix
        ./homebrew.nix
        ./tailscale.nix
    ];    
}