const audio = await Service.import('audio')

/** @param {'speaker' | 'microphone'} type */
const VolumeSlider = (type = 'speaker') => Widget.Slider({
  hexpand: true,
  drawValue: false,
  onChange: ({ value }) => audio[type].volume = value,
  value: audio[type].bind('volume'),
})

function audioSource(stream, name) {
  return Widget.Box({
    vertical: true,
    children: [
      Widget.Label({
        class_name: "audio_source_name",
        label: name,
        xalign: 0,
        justification: "left"
      }),
      VolumeSlider(stream)
    ]
  })
}

export function Audio() {
  return Widget.Box({
    class_name: "widget",
    vertical: true,
    children: [
      audioSource("speaker", "Speaker"),
      audioSource("microphone", "Microphone"),
    ]
  })
}
