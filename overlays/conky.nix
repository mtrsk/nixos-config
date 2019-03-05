self: super:

{
  conky = super.conky.override {
    nvidiaSupport = true;
    pulseSupport = true;
  };
}
