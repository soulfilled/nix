{ config, pkgs, ... }: {
  environment.variables.NIX_SHELL_PRESERVE_PROMPT = "true";
  i18n.defaultLocale = "en_US.UTF-8";  
  time.timeZone = "Asia/Karachi";
  system.stateVersion = "23.11";
  sound.enable = true;
  
  programs = {
    nm-applet.enable = true;
    seahorse.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  networking = {
    networkmanager.enable = true;
    hostName = "snowflake";
  };
  
  hardware = {
    pulseaudio.enable = true;
    opengl.enable = true;
  };

  services = {
    xserver = {
      displayManager.gdm.enable = false;
      windowManager.i3.enable = true;
      libinput.enable = true;
      enable = true;
    };

    thinkfan = {
      enable = true;
      levels = [
        [0  0   55]
        [3  48  60]
        [4  50  61]
        [5  52  63]
        [7  56  65]
        [7  60  85]
        ["level auto" 80 32767]
      ];
    };

    tlp.enable = true;
    upower.enable = true;
  };


  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      roboto-mono roboto-serif
      inter
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Roboto Serif" ];
        monospace = [ "SF Mono" ];
        sansSerif = [ "Inter" ];
      };
    };
  };
  
  users.users.soul = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
  };  
}