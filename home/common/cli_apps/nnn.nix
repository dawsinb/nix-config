{ pkgs, ... }:

{
  

  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override ({ withNerdIcons = true; });
    extraPackages = with pkgs; [
      less
      eza
      mediainfo
      mktemp
      unzip
      gnutar
      man
      libarchive
      bat
      ffmpegthumbnailer
      ffmpeg
      poppler_utils
      glow
    ];
    bookmarks = {
      d = "~/Documents";
      D = "~/Downloads";
      r = "~/repos";
      p = "~/repos/platform";
    };
    plugins = {
      src = (pkgs.fetchFromGitHub {
        owner = "jarun";
        repo = "nnn";
        rev = "v5.0";
        sha256 = "sha256-HShHSjqD0zeE1/St1Y2dUeHfac6HQnPFfjmFvSuEXUA=";
      }) + "/plugins";
      mappings = {
        p = "preview-tui";
      };
    };
  };

  programs.zsh.shellAliases = {
    n = "nnn -P p";
  };
  programs.zsh.envExtra = 
  let
    BLK="03";
    CHR="03"; 
    DIR="04";
    EXE="02"; 
    REG="07"; 
    HARDLINK="05"; 
    SYMLINK="05"; 
    MISSING="08"; 
    ORPHAN="01"; 
    FIFO="06"; 
    SOCK="03"; 
    UNKNOWN="01";
  in
  ''
  ## NNN
  # Set terminal used by NNN
  export NNN_TERMINAL=wezterm

  # For previews
  export NNN_FIFO=/tmp/nnn.fifo

  # Export Context Colors
  export NNN_COLORS="#04020301;4231"

  # Finally Export the set file colors
  export NNN_FCOLORS="${BLK}${CHR}${DIR}${EXE}${REG}${HARDLINK}${SYMLINK}${MISSING}${ORPHAN}${FIFO}${SOCK}${UNKNOWN}"
  '';
}
