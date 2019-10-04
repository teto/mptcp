with import <nixpkgs> {};
# inherit pkgs;
let
  # filter-src = builtins.filterSource (p: t: lib.cleanSourceFilter p t && baseNameOf p != "build");

 # TCP_CONG_ADVANCED

  # see https://nixos.wiki/wiki/Linux_Kernel
  # pkg = (linuxManualConfig {
  #   inherit stdenv;
  #   inherit (linux_mptcp_trunk) src version modDirVersion;
  #   # version = linux_mptcp_94.version;
  #   configfile = /home/teto/dotfiles/kernels/mptcp_trunk_netlink.config;
  #   # we need this to true else the kernel can't parse the config and 
  #   # detect if modules are in used
  #   allowImportFromDerivation = true;
  #   # modDirVersion="4.19.10";
  # });

  # pkg = linux_mptcp_trunk_raw;
  pkg = linux_mptcp_trunk_dev ;
  # SK_MEM_QUANTUM

in
  pkg.overrideAttrs (oa: {
    buildInputs = (oa.buildInputs or []) ++ [
      # pkgs.cquery # too old, some issues with coc + references
      pkgs.ccls
    ];
    shellHook = ''
      touch .scmversion
      echo "hello boss"
      export KCONFIG_CONFIG="$(pwd)/build/.config"
    '';
  })




