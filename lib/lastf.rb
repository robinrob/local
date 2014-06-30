#!/usr/bin/env ruby

# `lastf`` displays the N last-modified files matching the specified search-term.

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'


options = OpenStruct.new
options[:last] = 1
options[:search_term] = "\"\""

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: lastf [options]"

  opts.separator ""
  opts.separator "Specific options:"

  opts.on("-l", "--last [NUMBER]",
          "Number of latest files.") do |last|
    options.last = last.to_i
  end

  opts.on("-s", "--search [SEARCH TERM]",
          "Search term.") do |search_term|
    options.search_term = search_term
  end
  
  opts.on("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end

opt_parser.parse(ARGV)

awk_part = "awk '{ s = \"\"; for (i = 9; i <= NF; i++) s = s $i \" \" ; print s }'"

dir_part = options.search_term.split('/')[0..-2]
puts dir_part
command = "ls -lt | tail +2 | #{awk_part} | grep #{options.search_term} | head -#{options.last}"

# puts command

begin
  `#{command}`.split("\n")[0 .. -1].each do |str|
    puts str.split(";")[-1]
  end

rescue StandardError => e
end
