require 'rubygems'
require 'midiator'

#system("open 'Titanic 2004 GM-GS SoundFont 1.1.sf2'")
#sleep(2)

include MIDIator::Drums
midi = MIDIator::Interface.new
midi.autodetect_driver

midi.program_change(0,0) # piano
midi.program_change(1,32) # bass

3.times {
  midi.play(40, 1, 0)
  midi.play(40, 1, 1)
}
