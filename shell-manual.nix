with import <nixpkgs> {};
# inherit pkgs;
let
  # filter-src = builtins.filterSource (p: t: lib.cleanSourceFilter p t && baseNameOf p != "build");

# : modDirVersion 4.9.60 specified in the Nix expression is wrong, it should be: 4.9.87+
# TODO use manual config
# linuxManualConfig = makeOverridable (callPackage ../os-specific/linux/kernel/manual-config.nix {});
  pkg = pkgs.mptcp-local.override( {
    modVersion="4.9.87+";
    modDirVersion="4.9.87+";
  });

in
  pkg



