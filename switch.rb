#!/usr/bin/env ruby
require_relative "lib/clock"

clock = Clock.new
loop do
  clock.tick
  sleep 0.02
end
