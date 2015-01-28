#!/usr/bin/env ruby
require 'pi_piper'

# Control a physical clock by moving the second hand forward
class Clock
  def initialize
    @pin1 = PiPiper::Pin.new(:pin => 17, :direction => :out)
    @pin2 = PiPiper::Pin.new(:pin => 27, :direction => :out)
    @pin1.off
    @pin2.off
    @count = 0
  end

  # Move the second hand forward
  def tick
    if @count == 0
      pulse_pin(@pin1)
      @count = 1
    else
      pulse_pin(@pin2)
      @count = 0
    end
  end

  private

  def pulse_pin(pin)
    pin.on
    sleep 0.05
    pin.off
  end
end


clock = Clock.new
loop do
  clock.tick
  sleep 0.02
end
