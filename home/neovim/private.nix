{ pkgs, config }:

let
  plugin = pkgs.vimUtils.buildVimPlugin;
in
{
  vim-taskjuggler = plugin {
    name = "vim-taskjuggler";
    src = pkgs.fetchFromGitHub {
      owner = "kalafut";
      repo = "vim-taskjuggler";
      rev = "e94c9a0b06022d11a34310ad5f82c1c2bcd86fb7";
      sha256 = "0f8smjl6wi52p8n1hhl5zhk8i3lpsfndxxdammyybw2vz17s0j8q";
    };
  };

  tokyonight-nvim = plugin {
    name = "tokyonight.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "tokyonight.nvim";
      rev = "affb21a81e6d7de073378eb86d02864c594104d9";
      sha256 = "0q37ldqajhp46g0ikc3yfnq9bgmghqdb8884rc56sraql9g0nwmi";
    };
  };

  cmp-git = plugin {
    name = "cmp-git";
    src = pkgs.fetchFromGitHub {
      owner = "petertriho";
      repo = "cmp-git";
      rev = "6bcb61c0a5ec2e0d522ece7c8fb3e009f1c79261";
      sha256 = "0n00apdpm920hjddmyhzynqxzdqz1scmqays9p4c4b6dq06jblbr";
    };
  };
}
