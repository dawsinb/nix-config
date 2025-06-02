{ pkgs, ... }:

{
  nix = {
    useDaemon = true;

    settings = {
      substituters = [ "https://cache.nixos.org" ];
    };

    optimise.automatic = true;

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };

    extraOptions = ''
      experimental-features   = nix-command flakes
      keep-outputs            = true
      keep-derivations        = true
      warn-dirty              = false
    '';
  };

  nixpkgs.config.allowUnfree = true;
}
