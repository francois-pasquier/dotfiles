{ pkgs, lib, username, ... }:

{
  home.username = username;
  home.homeDirectory =
    if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "claude-code"
    ];

  home.packages = [
    pkgs.age
    pkgs.aria2
    pkgs.bat
    pkgs.b3sum
    pkgs.bottom
    pkgs.bundletool
    pkgs.claude-code
    pkgs.cmake
    pkgs.ctop
    pkgs.delta
    pkgs.difftastic
    pkgs.dust
    pkgs.eza
    pkgs.fastfetch
    pkgs.fd
    pkgs.fzf
    pkgs.gh
    pkgs.git
    pkgs.git-filter-repo
    pkgs.gnupg
    pkgs.go
    pkgs.google-cloud-sdk
    pkgs.iperf3
    pkgs.jless
    pkgs.jq
    pkgs.just
    pkgs.mise
    pkgs.mosh
    pkgs.neovim
    pkgs.ninja
    pkgs.nmap
    pkgs.nvd
    pkgs.openocd
    pkgs.ripgrep
    pkgs.rustup
    pkgs.scrcpy
    pkgs.sd
    pkgs.tealdeer
    pkgs.tmux
    pkgs.tree-sitter
    pkgs.yazi
    pkgs.wget
    pkgs.xclip
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    pkgs.mas
    pkgs.spicetify-cli
    pkgs.zsh
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    pkgs.capitaine-cursors
    pkgs.la-capitaine-icon-theme
    pkgs.scrcpy
    pkgs.whitesur-cursors
    pkgs.whitesur-icon-theme
    pkgs.whitesur-kde
  ];

  programs.home-manager.enable = true;
}
