#!/usr/bin/env ruby

# Outputs a running mean and standard devation from a STDIN of numbers.

require_relative '../lib/data-hacks'

opts = Trollop::options do
end

if STDIN.tty?
  puts "Nothing received on STDIN, awaiting your input: (CTRL-d to exit)"
end
DataHacks.stream_statistics(STDIN, opts)