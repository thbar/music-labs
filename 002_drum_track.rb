require 'rubygems'
require 'midiator'

#system("open 'Titanic 2004 GM-GS SoundFont 1.1.sf2'")
#sleep(2)

include MIDIator::Drums
midi = MIDIator::Interface.new
midi.autodetect_driver
midi.control_change 32, 10, 1 # TR-808 is Program 26 in LSB bank 1
midi.program_change 10, 26

pattern = <<PATTERN
B
C
BS
C
B
B
BS
C
PATTERN

require 'pp'

def pattern(midi, pattern)
  pattern.split("\n").each do |line|
    notes = line.split(//).map do |c|
      case c
        when "B";
          BassDrum1
        when "C";
          ClosedHiHat
        when "S";
          SnareDrum1
      end
    end
    pp notes
    midi.play(notes, 0.3, 10)
  end
end

4.times {
pattern(midi, pattern)
}