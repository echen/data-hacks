# What is this?!
A library of command-line utilities for data analysis, written in Ruby.
Type `--help` to see options.

## barchart.rb
Generates a barchart from input data. 

	$ barchart.rb < data/sample-string-data.txt 
	 Alice: ***** (5)
	   Bob: *** (3)
	 Carol: ***** (5)
	   Eve: *** (3)
	  Fran: * (1)
	Gordon: ** (2)
	 Isaac: * (1)
		
## histogram.rb
Generates a histogram from input data.

	$ histogram.rb < data/sample-numeric-data.txt 
	  [1.0, 2.0): ** (2)
	  [2.0, 3.0): *** (3)
	  [3.0, 4.0): ** (2)
	  [4.0, 5.0): * (1)
	  [5.0, 6.0): * (1)
	  [6.0, 7.0): 
	  [7.0, 8.0): 
	  [8.0, 9.0): ** (2)
	 [9.0, 10.0): * (1)
	[10.0, 11.0): *** (3)
	
## html_table.rb
Converts a table into HTML format, with sorting from the jQuery tablesorter plugin.

	$ html_table.rb --output-dir my_table_dir data/sample-table-data.txt 
		
## percentile.rb
Grabs a percentile from input data.

	$ percentile.rb --percentile 10 < data/sample-numeric-data.txt 
		
## run_for.rb
Copies STDIN for a specified duration.

	$ run_for.rb --duration 1 < data/sample-numeric-data.txt 
		
## sample.rb
Samples the input at a specified percentage.

	$ sample.rb --rate 10 < data/sample-string-data.txt

## stemplot.rb
Makes a stem-and-leaf plot from input data.

	$ stemplot.rb < data/sample-numeric-data.txt 
	-2 | 1 2
	-1 | 0 3 8
	 0 | 1 1 2 2 2 3 3 4 5 8 8 9
	 1 | 0 0 0
			
## stream_statistics.rb
Calculates a running mean and standard deviation from the input.

	$ stream_statistics.rb < data/sample-numeric-data.txt 
	10.0            (mean: 10.00, sd: 0.00)
	5.0             (mean: 7.50, sd: 6.25)
	10.0            (mean: 8.33, sd: 5.56)
	2.0             (mean: 6.75, sd: 11.69)
	1.0             (mean: 5.60, sd: 14.64)
	2.0             (mean: 5.00, sd: 14.00)
	3.0             (mean: 4.71, sd: 12.49)
	8.0             (mean: 5.12, sd: 12.11)
	9.0             (mean: 5.56, sd: 12.25)
	10.0            (mean: 6.00, sd: 12.80)
	4.0             (mean: 5.82, sd: 11.97)
	1.0             (mean: 5.42, sd: 12.74)
	2.0             (mean: 5.15, sd: 12.59)
	3.0             (mean: 5.00, sd: 12.00)
	8.0             (mean: 5.20, sd: 11.76)
	
## table.rb
Performs useful table operations.

	$ cat data/sample-table-data.txt | table.rb --columns 1,5 --skip-header --output-delimiter ,
	Alice,red
	Bob,green
	Carol,orange
	Eve,blue
	
	$ cat data/sample-table-data.txt | table.rb --print-header
	1. Name
	2. Age
	3. Location
	4. Birth
	5. Color