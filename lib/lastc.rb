#!/usr/bin/env ruby

# `lastc`` displays the N last-run commands matching the specified search-term.

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'


options = OpenStruct.new
options[:num] = 0
options[:search_term] = "\"\""

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: lastf [options]"

  opts.separator ""
  opts.separator "Specific options:"

  opts.on("-n", "--N [NUMBER]",
          "Number of history commands to search through.") do |num|
    options.num = last.to_i
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

history_part = "cat ~/.zhistory"
tail_part = " | tail -#{options.num + 1}"
grep_part = " | grep #{options.search_term}"

history_part << tail_part if options.num > 0

command = history_part + grep_part

`#{command}`.split("\n")[0 .. -2].each do |str|
  puts str.split(";")[-1]
end