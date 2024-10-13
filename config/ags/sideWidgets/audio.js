const audio = await Service.import('audio')

/** @param {'speaker' | 'microphone'} type */
const VolumeSlider = (type = 'speaker') => Widget.Slider({
  hexpand: true,
  drawValue: false,
  onChange: ({ value }) => audio[type].volume = value,
  value: audio[type].bind('volume'),
})
const AppVolumeSlider = (app) => Widget.Slider({
  hexpand: true,
  drawValue: false,
  onChange: ({ value }) => app.volume = value,
  value: app.bind('volume'),
})
function audioSource(stream, name) {
  return Widget.Box({
    vertical: true,
    children: [
      Widget.Box({
        spacing: 5,
        children: [
          Widget.Icon({ icon: stream == "microphone" ? "microphone-symbolic" : "speaker" }),
          Widget.Label({
            class_name: "audio_source_name",
            label: name,
            xalign: 0,
            justification: "left"
          })
        ]
      }),
      VolumeSlider(stream)
    ]
  })
}

function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

function AppAudioSource(app, name) {
  return Widget.Box({
    vertical: true,
    children: [
      Widget.Box({
        spacing: 5,
        children: [
          Widget.Icon({ icon: Utils.lookUpIcon(name) ? app.name : "audio-player" }),
          Widget.Label({
            class_name: "audio_source_name",
            label: capitalizeFirstLetter(app.name),
            xalign: 0,
            justification: "left"
          })
        ]
      }),
      AppVolumeSlider(app)
    ]
  })
}

function arraysEqual(a, b) {
  if (a === b) return true;
  if (a == null || b == null) return false;
  if (a.length !== b.length) return false;

  // If you don't care about the order of the elements inside
  // the array, you should sort both arrays here.
  // Please note that calling sort on an array will modify that array.
  // you might want to clone your array first.

  for (var i = 0; i < a.length; ++i) {
    if (a[i] !== b[i]) return false;
  }
  return true;
}

const AppVolume = () => {
  let apps = []
  const box = Widget.Box({
    class_name: "widget",
    vertical: true,
    setup: self => self.hook(audio, self => {
      if (!arraysEqual(apps, audio.apps)) {
        apps = audio.apps
        self.children = audio.apps.map((app) => AppAudioSource(app, app.name))
      }
      self.visible = audio.apps.length > 0;
    })
  })
  return box;
}

export function Audio() {
  return Widget.Box({
    vertical: true,
    children: [
      Widget.Box({
        class_name: "widget",
        vertical: true,
        children: [
          audioSource("speaker", "Speaker"),
          audioSource("microphone", "Microphone"),
        ]
      }),
      AppVolume()
    ]
  })
}
