#!/usr/bin/env ruby

# Generates a histogram from STDIN.

require_relative '../lib/data-hacks'

opts = Trollop::options do
  opt :bin_size, "Bin size", :type => :float, :default => 1.0
  opt :max_bar_height, "Maximum number of asterisks per bin", :type => :int, :default => 50
end

if STDIN.tty?
  puts "Nothing received on STDIN, awaiting your input: (CTRL-d to exit)"
end
DataHacks.make_histogram(STDIN, opts)