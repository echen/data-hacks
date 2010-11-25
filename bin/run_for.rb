#!/usr/bin/env ruby

# Outputs STDIN for a specified time.

require_relative '../lib/data-hacks'

opts = Trollop::options do
  opt :duration, "Duration (in seconds)", :type => :int, :default => 1
end
Trollop::die :duration, "must be >= 0" if opts[:duration] < 0

DataHacks.run_for(ARGF, opts)