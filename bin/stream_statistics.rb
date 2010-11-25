#!/usr/bin/env ruby

# Outputs a running mean and standard devation from a STDIN of numbers.

require_relative '../lib/data-hacks'

opts = Trollop::options do
end

DataHacks.stream_statistics(ARGF, opts)