{config, ...}:

{
  # Select internationalisation properties.
  console.useXkbConfig = true;

  # Defining the correct keyboard layout
  services.xserver = {
    layout = "br";
    xkbModel = "abnt2";
    xkbVariant = "abnt2";
  };

  # Set your time zone.
  time.timeZone = "America/Fortaleza";
}
