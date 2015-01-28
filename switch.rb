#!/usr/bin/env ruby
require 'pi_piper'

# Control a physical clock by moving the second hand forward
class Clock
  def initialize
    @pin1 = PiPiper::Pin.new(:pin => 17, :direction => :out)
    @pin2 = PiPiper::Pin.new(:pin => 27, :direction => :out)
    @pin1.off
    @pin2.off
    @pin = @pin1
  end

  # Move the second hand forward
  def tick
    # Turn pin1 on for a short time
    @pin.on
    sleep 0.05
    @pin.off
    if @pin == @pin1
      @pin = @pin2
    else
      @pin = @pin1
    end
  end
end


clock = Clock.new
loop do
  clock.tick
  sleep 0.02 
end
