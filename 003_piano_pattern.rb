require 'rubygems'
require 'midiator'

#system("open 'Titanic 2004 GM-GS SoundFont 1.1.sf2'")
#sleep(2)

include MIDIator::Drums
midi = MIDIator::Interface.new
midi.autodetect_driver

duration = 1

midi.play([54,59,62], duration, 1)
midi.play([54,59,62], duration, 1)
midi.play([54,59,62], duration, 1)
midi.play([54,59,64], duration, 1)

midi.play([54,57,64], duration, 1)
midi.play([54,57,61], duration, 1)
midi.play([54,57,61], duration, 1)
midi.play([54,57,64], duration, 1)

midi.play([52,55,59], duration, 1)
midi.play([52,55,59], duration, 1)
midi.play([52,55,59], duration, 1)
midi.play([52,55,62], duration, 1)

midi.play([54,57,61], duration, 1)
midi.play([54,57,61], duration, 1)
midi.play([54,58,62], duration, 1)
midi.play([54,58,64], duration, 1)

