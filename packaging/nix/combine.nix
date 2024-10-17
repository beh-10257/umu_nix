{ env, package, symlinkJoin,version }:
symlinkJoin {
  name = "umu-run-bwrap";
  paths = [
    env
    (package.override {version = "${version}";})
  ];
  postBuild = ''
    rm $out/bin/umu
  '';
}
