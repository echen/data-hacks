#!/usr/bin/env ruby

# Converts a table to a sortable HTML table. The first line of the table is assumed to be a header.

require_relative '../lib/data-hacks'

opts = Trollop::options do
  opt :delimiter, "Input column delimiter", :default => "\t"
  opt :output_dir, "Output directory (if you want the necessary Javascript and CSS to be included; otherwise, only a bare HTML file will be generated)", :type => :string
end

DataHacks.convert_table_to_html(ARGF, opts)