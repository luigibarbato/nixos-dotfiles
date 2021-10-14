{ config, pkgs, ... }:
{
programs.firefox = {
  enable = true;
  package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
    forceWayland = true;
    extraPolicies = {
      ExtensionSettings = {};
    };
  };
};

home.sessionVariables = {
  MOZ_ENABLE_WAYLAND = 1;
};

}