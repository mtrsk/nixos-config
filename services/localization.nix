{config, ...}:

{
  # Select internationalisation properties.
  i18n.consoleUseXkbConfig = true;

  # Defining the correct keyboard layout
  services.xserver = {
    layout = "br";
    xkbModel = "abnt2";
    xkbVariant = "abnt2";
  };

  # Set your time zone.
  time.timeZone = "America/Fortaleza";
}
