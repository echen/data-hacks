if Gem.available?('trollop')
  require 'trollop'
else
  require_relative 'trollop.rb'
end

module Enumerable  
  def each_int
    self.each do |x|
      yield x.strip.to_i
    end
  end
  
  def each_cleaned
    self.each do |x|
      yield x.strip
    end
  end
  
  def sample(n)
    raise ArgumentError, "n must be between 0 and 100" unless (0..100).include?(n)
    self.each do |x|
      yield x if rand(100) < n
    end
  end
  
  def stream_statistics
    running_sum = 0
    running_sum_of_squares = 0
    running_mean = 0
    running_sd = 0
    self.each_with_index do |x, i|
      x = x.to_f
      running_sum += x
      running_sum_of_squares += x ** 2
      running_mean = running_sum.to_f / (i + 1)
      running_sd = (running_sum_of_squares.to_f / (i + 1)) - (running_mean ** 2)      
      yield x, running_mean, running_sd
    end    
    return running_mean, running_sd
  end
end

class DataHacks
  def self.make_barchart(input_stream, opts)
    counts = Hash.new(0)
    input_stream.each_cleaned do |x|
      counts[x] += 1
    end
    
    max_key_length = counts.keys.map{ |k| k.length }.max
    max_value = counts.values.max
    
    scale = [1, counts.values.max.to_f / opts.max_bar_height].max    
    
    counts = counts.sort if opts.k # sort by key
    counts = counts.sort_by{ |x| x[1] } if opts.v # sort by value    
    counts = counts.reverse if opts.reverse # reverse    

    counts.each do |key, count|
      puts "#{key.rjust(max_key_length)}: #{"*" * (count / scale).ceil } (#{count})"
    end
  end
  
  def self.sample(input_stream, opts)
    input_stream.sample(opts.rate) do |x|
      puts x
    end
  end
  
  def self.get_percentile(input_stream, opts)
    data = input_stream.map{ |x| opts.numeric ? x.to_f : x }.sort
    which = (data.size - 1) * (opts.percentile / 100.0)
    puts data[which.ceil]
  end
  
  def self.run_for(input_stream, opts)
    endtime = Time.now + opts.duration
    input_stream.each do |x|
      break if Time.now > endtime
      puts x 
    end
  end
  
  def self.stream_statistics(input_stream, opts)    
    input_stream.stream_statistics do |x, mu, sd|
      puts "%s (mean: %.2f, sd: %.2f)" % [x.to_s.ljust(15), mu, sd]
    end
  end
  
  def self.make_histogram(input_stream, opts)
    counts = Hash.new(0)
    input_stream.each do |x|
      counts[x.to_f] += 1
    end
    
    buckets = Hash.new { |hash, key| hash[key] = 0 }
    bottom_bin_key = counts.keys.min
    counts.sort.each do |key, value|
      # Current bin is [bottom_bin_key, bottom_bin_key + opts.bin_size).
      # Change the bin until the current key is in it.
      until bottom_bin_key <= key and key < bottom_bin_key + opts.bin_size        
        buckets[bottom_bin_key] ||= 0
        bottom_bin_key += opts.bin_size 
      end
      buckets[bottom_bin_key] += value
    end

    max_bin_to_s_length = buckets.keys.map{ |bin_bottom| stringify_bin(bin_bottom, opts.bin_size).length }.max
    buckets.sort.each do |key, count|
      bin = stringify_bin(key, opts.bin_size)
      puts "#{bin.rjust(max_bin_to_s_length)}: " + (count > 0 ? "#{"*" * count} (#{count})" : "")
    end
  end
  
  def self.make_stemplot(input_stream, opts)
    stems_to_leaves = Hash.new { |hash, key| hash[key] = [] }
    input_stream.each_int do |x|
      stem, leaf = x.to_s[0..-2], x.to_s[-1]
      stem = "0" if stem.empty?
      if stem == "-"
        stem = "0"
        leaf = "-" + leaf
      end
      stems_to_leaves[stem] << leaf
    end
    max_stem_length = stems_to_leaves.keys.map(&:length).max
    stems_to_leaves.keys.sort_by(&:to_i).each do |stem|
      leaves = stems_to_leaves[stem]
      puts "#{stem.rjust(max_stem_length)} | #{leaves.sort_by(&:to_i).join(' ')}"
    end
  end
  
  def self.manipulate_table(input_stream, opts)
    if opts.print_header
      input_stream.each do |row|
        row.split(opts.delimiter).each_with_index do |col, i|
          puts "#{i+1}. #{col}"          
        end
        break
      end
      return
    end
    
    output_cols = opts.columns.split(",").map(&:to_i)
    input_stream.each_with_index do |row, i|
      next if opts.skip_header and i == 0
      
      row = row.split(opts.delimiter)
      selected = row.select.with_index{ |x, i| output_cols.include?(i+1) }
      puts selected.join(opts.output_delimiter)
    end
  end
  
  private
  
  def self.stringify_bin(bin_bottom, bin_size)
    "[%.1f, %.1f)" % [bin_bottom, bin_bottom + bin_size]    
  end
end