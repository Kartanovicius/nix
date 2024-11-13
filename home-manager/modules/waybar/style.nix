{ default }:
let
  OSLogo = builtins.fetchurl rec {
    name = "OSLogo-${sha256}.png";
    sha256 = "14mbpw8jv1w2c5wvfvj8clmjw0fi956bq5xf9s2q3my14far0as8";
    url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg";
  };
in
''
  * {
    font-family: "Fantasque Sans Mono", "JetBrains Mono", "Font Awesome 5 Free";
    font-weight: bold;
    font-size: 15px;
    transition: none;
    margin: 0px;
    border: none;
    border-radius: 0px;
    border-color: ${default.xcolors.border-light};
    color: ${default.xcolors.text-primary};
  }
  window#waybar {
    border-radius: 0px;
    background: ${default.xcolors.background-primary};
  }
  #waybar {
    margin: 0px;
  }
  #tags {
    margin: 0px;
    margin-top: 0px;
    margin-bottom: 0px;
    margin-left: 5px;
    padding: 0px;
  }
  #tags button {
    box-shadow: none;
    border-bottom: 2px solid ${default.xcolors.background-primary};
    background-color: ${default.xcolors.background-primary};
    color: ${default.xcolors.text-primary};
  }
  #tags button:hover {
    color: ${default.xcolors.text-primary};
    background-color: ${default.xcolors.background-primary};
    border-color: ${default.xcolors.grey-300};
  }
  #tags button.occupied {
    color: ${default.xcolors.text-primary};
    background-color: ${default.xcolors.background-primary};
    border-color: ${default.xcolors.grey-400};
  }
  #tags button.focused {
    color: ${default.xcolors.text-primary};
    background-color: ${default.xcolors.background-primary};
    border-color: ${default.xcolors.grey-500};
  }
  #network {
    padding-right: 14px;
  }
  #network, #pulseaudio, #battery {
    margin-left: 5px;
    margin-right: 5px;
  }
''
