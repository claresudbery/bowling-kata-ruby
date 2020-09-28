#!/usr/bin/env ruby

# There are two ways of using this.
# 1. Enter the inputs as a command line param, like this: 
#       ./src/bowling_cli.rb -r 'X X 5/ 4/ X X 8/ 1/ X X -5'
# 2. Pipe in the input, like this: 
#       echo 'X X 5/ 4/ X X 8/ 1/ X X -5' | ./src/bowling_cli.rb
# 3. Run the code with no params, then you will be prompted to enter the text on the command line. Like this:
#       ./src/bowling_cli.rb
#       (Then enter X X 5/ 4/ X X 8/ 1/ X X -5 on the command line afterwards)


require_relative './bowling'
require 'optparse'

options = {}
OptionParser.new do |parser|
    parser.on("-r", "--rolls=ROLLS", "The bowling rolls you want to score") do |value|
        options[:rolls] = value
    end
    parser.on("-h", "--help", "Prints this help") do
        puts parser
        exit
    end
end.parse!

if options[:rolls]
    puts Bowling.new.score(options[:rolls])        
else
    stdinput = gets.chomp
    if stdinput
        puts Bowling.new.score(stdinput)
    else
        puts "Please give a value for --rolls (-r)"  
    end
end 