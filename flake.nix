{
    description = "General Purpose Configuration for NixOS and MacOS";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        darwin.url = "github:LnL7/nix-darwin/master";
        darwin.inputs.nixpkgs.follows = "nixpkgs";

        # import an untracked host.nix file, see host.example.nix
        host.url = "git+file:./host.nix";
        host.flake = false;

        # Declarative tap management with nix-homebrew
        nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
        homebrew-core.url = "github:homebrew/homebrew-core";
        homebrew-core.flake = false;
        homebrew-cask.url = "github:homebrew/homebrew-cask";
        homebrew-cask.flake = false;

        rust-overlay.url = "github:oxalica/rust-overlay";
        rust-overlay.inputs.nixpkgs.follows = "nixpkgs";

        nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
        nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs @ { self, ... }: with inputs;
    let
        host = if (builtins.pathExists ./host.nix)
            then (import ./host.nix)
            else throw "Could not find ./host.nix configuration file, please create a host.nix file to define your system.";
    in
    {
        formatter.${host.system} = nixpgs.nixfmt;

        # ${if host.platform == "linux" then "nixosConfigurations.${host.system}.default" else null} = nixpkgs.lib.nixosSystem {
        #     specialArgs = { inherit inputs; inherit host; };
        #     modules = [
        #         # todo
        #     ];
        # };

        darwinConfigurations.${host.hostname} = darwin.lib.darwinSystem {
            specialArgs = { inherit inputs; inherit host; };
            system = host.system;
            modules = [
                ./system/common
                ./system/darwin

                inputs.home-manager.darwinModules.home-manager
                inputs.nix-homebrew.darwinModules.nix-homebrew
                
                ({ pkgs, ... }:{
                    nixpkgs.overlays = [ rust-overlay.overlays.default ];
                    environment.systemPackages = [ (pkgs.rust-bin.stable.latest.default.override { extensions = ["rust-src" "rust-analyzer"]; }) ];
                })
            ];
        };

        devShells.${host.system}.default = inputs.nixpkgs.mkShell {
            shellHook = ''
                echo "testing"
            '';

            nativeBuildInputs = with pkgs; [
                git
            ];
        };
    };
}