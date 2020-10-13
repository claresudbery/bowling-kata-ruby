#!/usr/bin/env ruby

# see readme.md for usage instructions


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
        puts "You didn't give a value for --rolls (-r), so I'm using the default value of 'X X 5/ 4/ X X 8/ 1/ X X -5'"  
        puts Bowling.new.score('X X 5/ 4/ X X 8/ 1/ X X -5')
    end
end 