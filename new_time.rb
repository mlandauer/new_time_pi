#!/usr/bin/env ruby
require "new_time"
require_relative "lib/clock"

point = NewTime::Point.new(-33.714955, 150.311407, "Australia/Sydney")
clock = Clock.new

loop do
  # First find out when the next tick of the clock should happen
  t0 = Time.now
  n0 = NewTime::NewTime.convert(t0, point)
  n1 = NewTime::NewTime.new(n0.year, n0.month, n0.day, n0.hours, n0.minutes, n0.seconds + 1, 0)
  t1 = n1.convert(point)
  wait = t1 - Time.now
  if wait < 0
    wait += 1
    puts "Skipped a second"
  end
  sleep(wait)
  clock.tick
  puts "#{n1} #{n1.seconds}"
end
