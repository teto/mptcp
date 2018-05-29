
with import <nixpkgs> {};
# inherit pkgs;
let
  # filter-src = builtins.filterSource (p: t: lib.cleanSourceFilter p t && baseNameOf p != "build");

  # pkg = pkgs.linux_mptcp;
  # pkg = mptcp-manual-dev;
# : modDirVersion 4.9.60 specified in the Nix expression is wrong, it should be: 4.9.87+
  pkg = pkgs.mptcp-local.override( {
    modVersion="4.9.87+";
    modDirVersion="4.9.87+";
  });

  # defined from overlay
  # .overrideAttrs (oldAttrs: {
  # });
in
  pkg
