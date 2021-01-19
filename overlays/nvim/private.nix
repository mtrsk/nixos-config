# Private Vim Plugins
# Blatantly stolen from Ivan Brennan
pkgs:

with pkgs.vimUtils;
{
  vim-pydocstring = pkgs.vimUtils.buildVimPlugin {
    name = "vim-pydocstring";
    src = pkgs.fetchFromGitHub {
      owner = "heavenshell";
      repo = "vim-pydocstring";
      rev = "1d387a4f1a83181eb010c8275a51985753b87995";
      sha256 = "0kjjff0hp6sh0h30j91c0l3vnxr82bp5w3rzdxam9qaw8b96jh9j";
    };
  };

  vim-taskjuggler = pkgs.vimUtils.buildVimPlugin {
    name = "vim-taskjuggler";
    src = pkgs.fetchFromGitHub {
      owner = "kalafut";
      repo = "vim-taskjuggler";
      rev = "e94c9a0b06022d11a34310ad5f82c1c2bcd86fb7";
      sha256 = "0f8smjl6wi52p8n1hhl5zhk8i3lpsfndxxdammyybw2vz17s0j8q";
    };
  };
}
