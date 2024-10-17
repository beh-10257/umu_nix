{ env, package, symlinkJoin, version ? "1.1.3" }:
symlinkJoin {
  name = "umu-run-bwrap";
  paths = [
    env
    (package.override {version = version;})
  ];
  postBuild = ''
    rm $out/bin/umu
  '';
}
