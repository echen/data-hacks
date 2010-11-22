#!/usr/bin/env ruby

# Generates a stem-and-leaf plot from STDIN.

require_relative '../lib/data-hacks'

opts = Trollop::options do
end

if STDIN.tty?
  puts "Nothing received on STDIN, awaiting your input: (CTRL-d to exit)"
end
DataHacks.make_stemplot(STDIN, opts)