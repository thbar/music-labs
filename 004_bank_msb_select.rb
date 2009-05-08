require 'rubygems'
require 'midiator'

#system("open 'Titanic 2004 GM-GS SoundFont 1.1.sf2'")
#sleep(2)

include MIDIator::Drums
midi = MIDIator::Interface.new
midi.autodetect_driver

def pattern(tick)
  [tick/4 == 2 ? 52 : 54,
   [59,59,57,57,55,55,57,58][tick/2],
   [62,62,62,64,64,61,61,64,59,59,59,62,61,61,62,64][tick]]    
end

def play(midi, channel)
  (0..15).each do |tick|
    pattern(tick).each { |note| midi.note_on(note, channel, 100) }
    sleep(1)
    pattern(tick).each { |note| midi.note_off(note, channel) }
  end
end

instruments = [ 
  [56,1], # trumpet section
  [56,0]  # trumpet
]

channel = 0

instruments.each do |program, bank_select_msb|
  midi.control_change 0x00, channel, bank_select_msb
  midi.program_change(channel, program)
  play(midi, channel)
end
