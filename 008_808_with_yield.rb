require 'rubygems'
require 'midiator'

#system("open 'soundfonts/tr808/TR-808 Drums.SF2'")
#sleep(2)

include MIDIator::Drums
midi = MIDIator::Interface.new
midi.autodetect_driver

bpm = 130.0
tick = 60 / bpm

k = lambda { [BassDrum1, 1] }

16.times do |i|
  notes, ticks = k.call(i)
  time_to_wait = tick * ticks
  midi.play(notes, time_to_wait)
end
