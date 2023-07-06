{ config, pkgs, lib, ... }: {
  xdg.configFile = {
      i3status.source = ../../../config/i3status;
      kitty.source = ../../../config/kitty;
      picom.source = ../../../config/picom;
      i3.source = ../../../config/i3;
    };

  home = {    
    packages = with pkgs; [
      volumeicon
      i3status
      picom
      kitty
      brave
      iwd
      git
      feh
    ];

    stateVersion = "23.11";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      vscodevim.vim
    ];
  };
}
