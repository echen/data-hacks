#!/usr/bin/env ruby

# Generates a barchart from STDIN.

require_relative '../lib/data-hacks'

opts = Trollop::options do
  opt :k, "Sort by key", :default => true
  opt :v, "Sort by value", :default => false
  opt :reverse, "Reverse sort", :default => false
  opt :max_bar_height, "Maximum number of asterisks per bar", :type => :int, :default => 50
end

if STDIN.tty?
  puts "Nothing received on STDIN, awaiting your input: (CTRL-d to exit)"
end
DataHacks.make_barchart(STDIN, opts)