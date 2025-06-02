{ pkgs, inputs, ... }:

{
  home.packages = [ pkgs.vscode ];
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    extensions =
      with inputs.nix-vscode-extensions.extensions.aarch64-darwin.open-vsx; [
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
        catppuccin.catppuccin-vsc
        mkhl.direnv
        nefrob.vscode-just-syntax
        zxh404.vscode-proto3
      ];
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.semanticHighlighting.enabled" = true;
      "window.titleBarStyle" = "custom";
      "editor.inlayHints.enabled" = "offUnlessPressed";
    };
  };
}
