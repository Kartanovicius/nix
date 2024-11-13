{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

let
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components; [ gke-gcloud-auth-plugin ]
  );
in
{
  #Packages
  environment.systemPackages = with pkgs; [
    home-manager

    # Browsers
    google-chrome
    brave
    ungoogled-chromium
    inputs.zen-browser.packages."x86_64-linux".default
    surf

    # Media
    spotify
    vlc

    # GUI Apps
    gnome-calculator
    # gparted
    meld
    libreoffice
    kanshi
    pcmanfm
    inkscape-with-extensions
    unstable.logseq
    unstable.remmina
    drawing
    obs-studio

    # CLI Apps
    ranger
    imagemagick
    zip
    unzip
    playerctl
    ffmpegthumbnailer # Terminal video libs
    ffmpeg # Terminal video libs
    jq
    wget
    tmux
    curl
    wl-clipboard

    # Terminal
    zsh
    kitty

    # Dev
    nodejs_18
    yarn
    unstable.bun
    git
    tig
    lazygit
    pnpm
    pnpm-shell-completion
    nodePackages.prettier
    nodePackages.typescript-language-server
    typescript
    gitlab-runner
    docker
    temurin-jre-bin-21
    maven
    php
    gdk
    google-cloud-sdk
    postgresql
    insomnia
    biome
    supabase-cli
    rustc
    rustup
    cargo
    cargo-generate
    gcc
    sass
    sassc
    docker-compose
    lazydocker
    lunarvim
    dbeaver-bin

    # System information
    htop
    btop
    libnotify
    toybox
    hwinfo
    fastfetch

    # Settings
    pavucontrol

    # System
    dconf
    xorg.xbacklight
    brightnessctl
    lm_sensors
    qrencode
    chromedriver
    bluez
    alsa-utils

    # IDE
    unstable.vscode
    jetbrains-toolbox
    zed-editor
    # android-studio

    # Messengers
    tdesktop
    unstable.signal-desktop

    # Screen Recording and Capture
    wf-recorder
    slurp
    grim
    swappy

    # Hyprland/Sway/River
    hyprpaper
    swaylock
    swayidle
    swaybg
    mako # notification daemon
    xwayland
    glib
    xdg-utils
    wdisplays
    hyprpicker # Color Picker
    wl-color-picker # Color Picker
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    # eww
    hyprland-protocols
    xdg-utils

    # Customizations
    bibata-cursors
    adwaita-icon-theme
    dracula-theme
    adwaita-qt

    # Keyring and Polkit
    libgnome-keyring
    libgnome-keyring
    gnome-keyring
    seahorse
    keepassxc
    polkit
    lxde.lxsession

    # LSP
    nixpkgs-fmt
    nixfmt-rfc-style
    rustfmt
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    "electron-19.1.9"
    "electron-27.3.11"
    "nodejs-18.18.2"
    "nodejs-16.20.2"
    "nodejs-16.20.0"
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    siji
    fantasque-sans-mono
    fira-code
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
  };
}
