self: super:

{
  ncmpcpp = super.ncmpcpp.override {
    outputsSupport = true;
    visualizerSupport = true;
  };
}
