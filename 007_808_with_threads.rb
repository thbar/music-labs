require 'rubygems'
require 'midiator'

#system("open 'soundfonts/tr808/TR-808 Drums.SF2'")
#sleep(2)

include MIDIator::Drums
midi = MIDIator::Interface.new
midi.autodetect_driver

bpm = 130.0
tick = 60 / bpm

Thread.new do
  16.times do
    midi.play(BassDrum1, tick)
  end
end

Thread.new do
  16.times do |i|
    if i%2 == 0
      sleep(tick)
    else
      midi.play(SnareDrum2, tick)
    end
  end
end

Thread.new do
  8.times do |i|
    duration = tick / 1.5
    midi.play(ClosedHiHat, duration)
    midi.play(ClosedHiHat, duration)
    midi.play(OpenHiHat, duration)
  end
end

Thread.list.each { |t| t.join unless t == Thread.main }