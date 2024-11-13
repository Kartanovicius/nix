import Battery from "./battery";
import { Time, DateItem } from "./date";
import { ColorPicker } from "./utils/color-picker";
import NetworkIndicator from "./network";
import ToggleAudioTray from "./audio";

const Start = () => {
  return Widget.Box({
    hpack: "start",
    vpack: "center",
    spacing: 15,
    marginLeft: 15,
    children: [ColorPicker() /*Screenshot()*/],
  });
};

const Center = () => {
  return Widget.Box({
    hpack: "end",
    vpack: "center",
    spacing: 0,
    // children: [Workspaces()],
  });
};

const End = () => {
  return Widget.Box({
    hpack: "end",
    spacing: 15,
    marginRight: 15,
    children: [NetworkIndicator(), ToggleAudioTray(), Battery(), Time(), DateItem()],
    // children: [Bluetooth(), Network(), Audio(), Battery(), Time(), Date(), ToggleTray()],
  });
};

const Bar = (monitor) =>
  Widget.Window({
    name: `bar${monitor}`,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    className: "bar",
    child: Widget.CenterBox({
      start_widget: Start(),
      center_widget: Center(),
      end_widget: End(),
    }),
  });

export default Bar;
