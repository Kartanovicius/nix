{ pkgs, ... }:

{
  systemd.services.keyring-deamon = {
    enable = true;
    script = ''
      echo "gnome keyring deamon"
      eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh);
      export SSH_AUTH_SOCK;
    '';
    wantedBy = [ "multi-user.target" ]; # starts after login
  };

  # environment.extraInit = ''
  #   river
  # '';

  environment = {
    sessionVariables = {
      EDITOR = "code";
      GPG_TTY = "$TTY";
      MOZ_ENABLE_WAYLAND = "1";
      TERMCMD = "kitty";
      TERM = "kitty";
      LIBSEAT_BACKEND = "logind";
      QT_STYLE_OVERRIDE = "adwaita-dark";
    };
    shells = with pkgs; [ zsh ];
  };
}
