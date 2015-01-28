#!/usr/bin/env ruby

# Little script to calibrate the pulse length needed to reliably advance the second hand of
# the clock

require_relative "lib/clock"
require "io/console"

# Starting range
bad = 0.0
good = 0.5


loop do
  puts "Value is now between #{bad} and #{good}"
  test_value = (bad + good) / 2

  clock = Clock.new(pulse_time: test_value)
  (1..60).each do |i|
    clock.tick
  end

  puts "Did that advance reliably? (y/n)"

  c = STDIN.getch
  if c == "y"
    good = test_value
  elsif c == "n"
    bad = test_value
  else
    raise
  end
end
