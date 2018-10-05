with import <nixpkgs> {};
# inherit pkgs;
let
  # filter-src = builtins.filterSource (p: t: lib.cleanSourceFilter p t && baseNameOf p != "build");

# : modDirVersion 4.9.60 specified in the Nix expression is wrong, it should be: 4.9.87+

# linuxManualConfig

  pkg = linuxManualConfig {
    inherit stdenv;
    inherit (linux_mptcp_94) src version modDirVersion;
    # version = linux_mptcp_94.version;

    configfile = /home/teto/dotfiles/kernels/mptcp94.config;
    # we need this to true else the kernel can't parse the config and 
    # detect if modules are in used
    allowImportFromDerivation = true;
    # modDirVersion="4.14.70";
  };

  # pkg = pkgs.mptcp-local.override( {
  #   modVersion="4.9.87+";
  #   modDirVersion="4.9.87+";
  # });

in
  pkg



