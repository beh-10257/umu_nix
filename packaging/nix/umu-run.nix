{ package, buildFHSEnv, writeShellScript,version, ...}:
buildFHSEnv {
  name = "umu-run";
  version = "${version}";
  runScript = writeShellScript "umu-run-shell" ''
    ${package}/bin/umu "$@"
  '';
}
