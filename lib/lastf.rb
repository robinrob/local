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

command = "ls -lt | tail +2 | awk '{print $9}' | grep #{options.search_term} | head -#{options.last}"

begin
  `#{command}`.split("\n")[0 .. -1].each do |str|
    puts str.split(";")[-1]
  end

rescue StandardError => e
end
