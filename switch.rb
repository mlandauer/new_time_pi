#!/usr/bin/env ruby

# Control a physical clock by moving the second hand forward
class Clock
  attr_accessor :development

  def initialize
    if Clock.raspberry_pi?
      @pin1 = PiPiper::Pin.new(:pin => 17, :direction => :out)
      @pin2 = PiPiper::Pin.new(:pin => 27, :direction => :out)
      @pin1.off
      @pin2.off
    end
    @count = 0
  end

  def self.raspberry_pi?
    RUBY_PLATFORM == "arm-linux-eabihf"
  end

  # Move the second hand forward
  def tick
    if @count == 0
      if Clock.raspberry_pi?
        pulse_pin(@pin1)
      else
        puts "Tick..."
      end
      @count = 1
    else
      if Clock.raspberry_pi?
        pulse_pin(@pin2)
      else
        puts "Tock..."
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

if Clock.raspberry_pi?
  require 'pi_piper'
end

clock = Clock.new
loop do
  clock.tick
  sleep 0.02
end
