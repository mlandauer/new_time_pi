#!/usr/bin/env ruby
require 'pi_piper'

pin1 = PiPiper::Pin.new(:pin => 17, :direction => :out)
pin2 = PiPiper::Pin.new(:pin => 27, :direction => :out)
pin1.off
pin2.off

pin = pin1

loop do
  # Turn pin1 on for a short time
  pin.on
  sleep 0.05
  pin.off
  if pin == pin1
    pin = pin2
  else
    pin = pin1
  end
  sleep 0.02 
end
