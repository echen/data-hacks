#!/usr/bin/env ruby

# Generates a stem-and-leaf plot from STDIN.

require_relative '../lib/data-hacks'

opts = Trollop::options do
end

DataHacks.make_stemplot(ARGF, opts)