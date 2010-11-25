#!/usr/bin/env ruby

# Sorts STDIN and grabs a percentile.

require_relative '../lib/data-hacks'

opts = Trollop::options do
  opt :percentile, "Percentile (an integer between 0 and 100)", :type => :int, :default => 10
  opt :numeric, "Input is numeric.", :default => true
end
Trollop::die :percentile, "must be <= 100" if opts[:percentile] > 100
Trollop::die :percentile, "must be >= 0" if opts[:percentile] < 0

DataHacks.get_percentile(ARGF, opts)