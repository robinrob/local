#!/usr/bin/env ruby

# `numf`` displays the N num-modified files matching the specified search-term.

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
require 'colorize'


options = OpenStruct.new
options[:num] = 1
options[:search_term] = ENV['SCREENSHOT_NAME']
options[:name] = "screenshot"
options[:directory] = "moved_screenshots"

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: mvs [options]"

  opts.separator ""
  opts.separator "Specific options:"

  opts.on("-n", "--num [NUMBER]",
          "Number of latest files.") do |num|
    options.num = num.to_i
  end

  opts.on("-s", "--search [SEARCH TERM]",
          "Search term.") do |search_term|
    options.search_term = search_term
  end
  
  opts.on("-d", "--directory [DIRECTORY]",
          "Directory to move to") do |dir|
    options.directory = dir
  end
  
  opts.on("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end

opt_parser.parse(ARGV)

`mkdir -p #{options.directory}`

filenames = `lastf -n #{options.num} -s #{options.search_term}`.split(/\ \n/)

filenames.each_with_index do |filename, i|
  command = "cp '#{filename}' #{options.directory}/#{options.directory}_#{i+1}.png"
  puts command.green
  `#{command}`
end