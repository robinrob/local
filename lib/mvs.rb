#!/usr/bin/env ruby

# `numf`` displays the N num-modified files matching the specified search-term.

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
require 'colorize'


options = OpenStruct.new
options[:num] = 1
options[:search_term] = "\"\""
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
  
  opts.on("-n", "--name [NAME]",
          "Directory to move to") do |name|
    options.name = name
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

screenshot_name = ENV['SCREENSHOT_NAME']
filenames = `numf -l #{options.num} -s #{screenshot_name}`.split(/\ \n/)

`mkdir -p #{options.directory}`

filenames.each_with_index do |filename, i|
  command = "mv '#{filename}' #{options.directory}/#{options.name}_#{i+1}".green
  puts command
  `mv '#{filename}' #{options.directory}/#{options.name}_#{i+1}.png`
end