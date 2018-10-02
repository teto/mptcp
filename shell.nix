with import <nixpkgs> {};
# inherit pkgs;
let
  # filter-src = builtins.filterSource (p: t: lib.cleanSourceFilter p t && baseNameOf p != "build");

# : modDirVersion 4.9.60 specified in the Nix expression is wrong, it should be: 4.9.87+

# linuxManualConfig

  pkg = linuxManualConfig {
    inherit stdenv;
    inherit (linux_mptcp_94) src;
    version = "${linux_mptcp_94}-custom";
    # version = "${linux_4_9.version}-custom";

    configfile = /home/teto/dotfiles/kernels/mptcp94.config;
    # we need this to true else the kernel can't parse the config and 
    # detect if modules are in used
    allowImportFromDerivation = true;
    # TODO inherit it
    # modDirVersion="4.9.87matt";
  };

  # pkg = pkgs.mptcp-local.override( {
  #   modVersion="4.9.87+";
  #   modDirVersion="4.9.87+";
  # });

in
  pkg



