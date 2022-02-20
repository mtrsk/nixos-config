{pkgs, ...}:

{
  home.packages = with pkgs; [
    age
    lynis
    magic-wormhole
    openssl
    tarsnap
    tomb
    zbar # for pass-otp
  ];

  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (
      exts: [
        exts.pass-tomb
        exts.pass-otp
      ]
    );
    settings = {
      PASSWORD_STORE_DIR = "\$HOME/.password-store";
    };
  };
}
