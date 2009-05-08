require 'rubygems'
require 'midiator'

include MIDIator::Drums
midi = MIDIator::Interface.new
midi.autodetect_driver

midi.program_change(0,0) # piano
midi.program_change(1,32) # bass

Thread.new do
  midi.play(40, 1, 0)
  sleep(1)
  midi.play(40, 1, 0)
  sleep(1)
end

Thread.new do
  sleep(1)
  midi.play(40, 1, 1)
  sleep(1)
  midi.play(40, 1, 1)
end

Thread.list.each { |t| t.join unless t == Thread.main }