#!/usr/bin/env ruby
require_relative "lib/clock"

clock = Clock.new

time_between_ticks = 0.5

start = Time.now
loop do
  clock.tick
  t = Time.now - start
  ticks = t / time_between_ticks
  wait = ticks.ceil * time_between_ticks - t
  sleep wait
end
