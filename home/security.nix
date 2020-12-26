{pkgs, home, ...}:

{
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (
      exts: [ exts.pass-otp ]
    );
    settings = {
      PASSWORD_STORE_DIR = "\$HOME/.password-store";
    };
  };
}
