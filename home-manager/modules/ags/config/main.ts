import Bar from "./widgets/bar/bar";
const path = "/home/donatask/nix/home-manager/modules/ags/config";

Utils.monitorFile(`${path}/style`, function () {
  Utils.exec(`sassc ${scss} ${css}`);
  App.resetCss();
  App.applyCss(css);
});

const scss = `${path}/style/index.scss`;
const css = `/tmp/ags/index.css`;
Utils.exec(`sassc ${scss} ${css}`);
App.applyCss(css);

const bars = Bar(0);

App.config({
  windows: [bars],
});
