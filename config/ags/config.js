const hyprland = await Service.import('hyprland')
const monitors = hyprland.bind("monitors");

import { TopBar } from "./topBar/main.js"
import { Audio } from "./sideWidgets/audio.js"
import { Media } from "./sideWidgets/musicPlayer.js"
import Workspaces from "./Workspaces.js"
import { Notify } from "./notifi/main.js";


globalThis.batMinLimit = 20;


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
        css: "min-width:400px",
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


globalThis.sidebaOpen = Variable(false);
globalThis.sidebar = () => {
  const monitor = hyprland.active.monitor.id ?? 0
  if (sidebar.monitor == monitor) {
    sidebar.visible = !sidebar.visible;
  } else {
    sidebar.monitor = monitor
    sidebar.visible = true
  }
  globalThis.sidebaOpen.setValue(sidebar.visible);
}



const battery = await Service.import('battery')
const BatBorder = (monitor = 0) => Widget.Window({
  keymode: "none",
  layer: "overlay",
  css: "background: rgba(0,0,0,0)",
  monitor: monitor,
  sensitive: false,
  visible: Utils.merge([
    battery.bind("percent").as(p => p <= (globalThis.batMinLimit ?? 15)),
    battery.bind('available')
  ], (bat, bata) => bat && bata),
  anchor: ["bottom"],
  child: Widget.Box({
    class_name: "batLowBanner",
    child: Widget.Label({ sensitive: false, css: "padding:2px; color: white", label: "Low Battery!" })
  })
})

App.config({
  windows: [
    sidebar, // can be instantiated for each monitor
    Notify(0)
  ],
  style: './style.css',
})

hyprland.monitors.forEach(monitor => {
  App.add_window(TopBar(monitor.id))
  App.add_window(BatBorder(monitor.id))
})

/*
Utils.monitorFile(
  // directory that contains the scss files
  `${App.configDir}/style.css`,

  // reload function
  function() {
    // main scss file
    const css = `${App.configDir}/style.css`
    App.resetCss()
    App.applyCss(css)
  },
)
*/
