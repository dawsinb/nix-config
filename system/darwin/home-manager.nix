{ pkgs, inputs, host, ... }:

{
    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${host.user}.imports = [ ../../home/common ../../home/darwin ];
    };

    users.users.${host.user} = {
        home = "/Users/${host.user}";
    };
}