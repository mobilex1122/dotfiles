const hyprland = await Service.import('hyprland')

const focusedTitle = () => Widget.Label({
  label: hyprland.active.client.bind('title'),
  visible: hyprland.active.client.bind('address')
    .as(addr => addr !== "0x"),
})

const dispatch = ws => hyprland.messageAsync(`dispatch workspace ${ws}`);

const Workspaces = (monitor = -1) => Widget.EventBox({
  onScrollUp: () => dispatch('+1'),
  onScrollDown: () => dispatch('-1'),
  child: Widget.Box({
    spacing: 5,
    children: Array.from({ length: 10 }, (_, i) => i + 1).map(i => Widget.Button({
      attribute: i,
      label: `${i}`,
      onClicked: () => dispatch(i),
    })),

    // remove this setup hook if you want fixed number of buttons
    setup: self => self.hook(hyprland, () => self.children.forEach(btn => {
      btn.visible = hyprland.workspaces.some(ws => ws.id === btn.attribute && (monitor === -1 || ws.monitorID === monitor));
      btn.class_name = hyprland.active.workspace.id == btn.attribute ? "active" : "";
    })),
  }),
})

const time = Variable('', {
  poll: [1000, 'date +"%H:%M"'],
})
const date = Variable('', {
  poll: [120000, 'date +"%D"'],
})

const DateTray = () => {
  return Widget.Box({
    class_name: "DateBox",
    vertical: true,
    children: [
      Widget.Label({ label: time.bind(), class_name: "timeLabel", justification: "center" }),
      Widget.Label({ label: date.bind(), class_name: "dateLabel", justification: "center" }),

    ]
  })
}


const systemtray = await Service.import('systemtray')

/** @param {import('types/service/systemtray').TrayItem} item */
const SysTrayItem = item => Widget.Button({
  class_name: "trayIcon",
  child: Widget.Icon().bind('icon', item, 'icon'),
  tooltipMarkup: item.bind('tooltip_markup'),
  onPrimaryClick: (_, event) => item.activate(event),
  onSecondaryClick: (_, event) => item.openMenu(event),
});

const SysTray = () => Widget.Box({
  spacing: 5,
  children: systemtray.bind('items').as(i => i.map(SysTrayItem))
})


const button = () => Widget.Button({
  child: Widget.Label({
    label: globalThis.sidebaOpen.bind().as((value) => value ? '' : '')
  }),
  class_name: globalThis.sidebaOpen.bind().as((value) => value ? 'sidebarButton active' : "sidebarButton"),
  onClicked: () => globalThis.sidebar(),
})

const battery = await Service.import('battery')

const BatteryTray = () => Widget.Box({
  children: [Widget.Icon({
    class_name: "batteryIcon",
    icon: battery.bind('icon_name'),
    tooltipText: Utils.merge([
      battery.bind('charging').as(ch => ch ? 'Charging' : 'Discharging'),
      battery.bind("percent").as(p => (p + "%"))
    ], (chrg, percent) => {
      return `${chrg}: ${percent}`
    })
  }),
  Widget.Label({ label: battery.bind("percent").as(p => p + "%") })
  ],
  visible: battery.bind('available'),
})

const audio = await Service.import('audio')
const VolumeIndicator = () => Widget.Button({
  class_name: "trayIcon",
  on_secondary_click: () => globalThis.sidebar(),
  on_clicked: () => audio.speaker.is_muted = !audio.speaker.is_muted,
  child: Widget.Icon().hook(audio.speaker, self => {
    const vol = audio.speaker.volume * 100;
    let icon = [
      [101, 'overamplified'],
      [67, 'high'],
      [34, 'medium'],
      [0, 'low'],
    ].find(([threshold]) => threshold <= vol)?.[1];
    if (audio.speaker.is_muted) {
      icon = "muted"
    }
    self.icon = `audio-volume-${icon}-symbolic`;
    self.tooltip_text = `Volume ${Math.floor(vol)}%`;
  }),
})

const leftBar = (monitor) => [
  button(),
  Workspaces(monitor),
  focusedTitle(),
]

const centerBar = () => [
]

const rightBar = () => [
  VolumeIndicator(),
  SysTray(),
  BatteryTray(),
  DateTray()
]


export function TopBar(monitor = 0) {
  return Widget.Window({
    anchor: ["top", "left", "right"],
    name: "topbar-" + monitor,
    monitor: monitor,
    layer: "bottom",
    className: Utils.merge([
      battery.bind("percent").as(p => p <= (globalThis.batMinLimit ?? 15)),
      battery.bind('available'),
      battery.bind("charging")
    ], (bat, bata, batc) => `topBarMain ` + (bat && bata && !batc ? "batLow" : "")),
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      class_name: "topBar",
      startWidget: Widget.Box({
        spacing: 5,
        children: leftBar(monitor)
      }),
      centerWidget: Widget.Box({
        children: centerBar(monitor)
      }),
      endWidget: Widget.Box({
        spacing: 5,
        hpack: "end",
        children: rightBar(monitor)
      })
    })
  })
}
