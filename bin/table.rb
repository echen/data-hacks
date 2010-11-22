#!/usr/bin/env ruby

# Performs useful table operations.

require_relative '../lib/data-hacks'

opts = Trollop::options do
  opt :columns, "Columns to output (separated by commas)", :type => :string
  
  opt :delimiter, "Input column delimiter", :default => "\t"
  opt :output_delimiter, "Output column delimiter", :default => "\t"
  
  opt :skip_header, "Skip the first line", :default => false
  
  opt :print_header, "Print the header and exit", :default => false
end
Trollop::die "no commands given" if !opts[:columns] and !opts[:print_header]

if STDIN.tty?
  puts "Nothing received on STDIN, awaiting your input: (CTRL-d to exit)"
end
DataHacks.manipulate_table(STDIN, opts)