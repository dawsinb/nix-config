# TODO: The extra config is broken, need to fix it
{ pkgs, ... }:

{
  home.packages = [ pkgs.wezterm ];
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'

      local config = wezterm.config_builder()

      -- Required for things to properly render
      -- See: https://github.com/wez/wezterm/issues/5990
      config.front_end = "WebGpu"

      config.color_scheme = "Catppuccin Mocha"
      config.window_background_opacity = 0.85
      config.macos_window_background_blur = 20

      config.font = wezterm.font 'JetBrainsMono Nerd Font'

      -- bar plugin
      local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
      bar.apply_to_config(config)

      return config
    '';
  };
}
