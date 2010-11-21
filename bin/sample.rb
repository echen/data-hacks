#!/usr/bin/env ruby

# Samples lines from STDIN.

require_relative '../lib/data-hacks'

opts = Trollop::options do
  opt :rate, "Sampling rate (an integer between 0 and 100)", :type => :int, :default => 10
end
Trollop::die :rate, "must be <= 100" if opts[:rate] > 100
Trollop::die :rate, "must be >= 0" if opts[:rate] < 0

if STDIN.tty?
  puts "Nothing received on STDIN, awaiting your input: (CTRL-d to exit)"
end
DataHacks.sample(STDIN, opts)