{ package, buildFHSEnv, writeShellScript, ...}:
buildFHSEnv {
  pname = "umu-run";
  runScript = writeShellScript "umu-run-shell" ''
    ${package}/bin/umu "$@"
  '';
}
