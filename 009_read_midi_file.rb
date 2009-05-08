require 'rubygems'
require 'midilib'

require 'midilib/io/seqreader'

# Create a new, empty sequence.
seq = MIDI::Sequence.new()

file = Dir[File.dirname(__FILE__) + "/**/Funk 1 1Bar 1A.mid"].first

# Read the contents of a MIDI file into the sequence.
File.open(file, 'rb') do |file|
  seq.read(file) do |track, num_tracks, index|
     puts "read track #{index} of #{num_tracks}"
  end
end

require 'pp'

seq.each { | track |
  track.each { | event |
    if event.note?
      pp event
    end
  }
}