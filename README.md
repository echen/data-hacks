# What is this?!
A ruby port (+ more) of bit.ly's command-line [data hacks](https://github.com/bitly/data_hacks).
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
		
## percentile.rb
Grabs a percentile from input data.

	$ percentile.rb --percentile 10 < data/sample-numeric-data.txt 
		
## run_for.rb
Copies STDIN for a specified duration.

	$ run_for.rb --duration 1 < data/sample-numeric-data.txt 
		
## sample.rb
Samples the input.

	$ sample.rb < data/sample-string-data.txt
		
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