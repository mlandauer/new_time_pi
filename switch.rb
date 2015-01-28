#!/usr/bin/env ruby
require 'pi_piper'

# Control a physical clock by moving the second hand forward
class Clock
  attr_accessor :development

  def initialize(development = false)
    @development = development
    if !development
      @pin1 = PiPiper::Pin.new(:pin => 17, :direction => :out)
      @pin2 = PiPiper::Pin.new(:pin => 27, :direction => :out)
      @pin1.off
      @pin2.off
    end
    @count = 0
  end

  # Move the second hand forward
  def tick
    if @count == 0
      if development
        puts "Tick..."
      else
        pulse_pin(@pin1)
      end
      @count = 1
    else
      if development
        puts "Tock..."
      else
        pulse_pin(@pin2)
      end
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
