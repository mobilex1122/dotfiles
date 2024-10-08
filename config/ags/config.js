const hyprland = await Service.import('hyprland')

import { Audio } from "./sideWidgets/audio.js"
import { Media } from "./sideWidgets/musicPlayer.js"
import Workspaces from "./Workspaces.js"

function Bar(monitor = 0) {
  const myLabel = Widget.Label({
    label: 'some example content',
  })

  const box = Widget.Box({
    spacing: 8,
    children: [
      Workspaces(monitor)
    ]
  })

  return Widget.Window({
    monitor,
    name: `bar${monitor}`, // this name has to be unique
    anchor: ['top', 'left', 'right'],
    child: box,
  })
}


let activeMonitor = Variable(0);
globalThis.activeMonitor = activeMonitor;
let sidebarChildren = []


sidebarChildren.push(Media());
sidebarChildren.push(Audio())

sidebarChildren.push(Widget.Box({
  class_name: "spacer",
  vexpand: true,
  hexpand: true
}))

let sidebar = Widget.Window({
  monitor: activeMonitor.bind(),
  name: "sidebar-window",
  anchor: ["left", "top", "bottom"],
  child: Widget.Box({
    vertical: true,
    spacing: 10,
    name: "sidebar",
    child: Widget.Scrollable({
      hscroll: "never",
      vscroll: "automatic",
      child: Widget.Box({
        vertical: true,
        children: sidebarChildren
      })
    })
  }),
  visible: false,
  //keymode: "exclusive",
  layer: "overlay",
  margins: [0, 0, 0, 0]
})

globalThis.sidebar = () => {
  const monitor = hyprland.active.monitor.id ?? 0
  if (sidebar.monitor == monitor) {
    sidebar.visible = !sidebar.visible;
  } else {
    sidebar.monitor = monitor
    sidebar.visible = true
  }
}



App.config({
  windows: [
    sidebar, // can be instantiated for each monitor
  ],
  style: './style.css',
})
