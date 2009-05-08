require 'rubygems'
require 'midiator'

midi = MIDIator::Interface.new
midi.autodetect_driver
(84..84+12).each do |r|
  midi.play( r, 0.1 )
end