#!/usr/bin/env ruby

# `lastf`` displays the N last-modified files matching the specified search-term.

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
require 'colorize'

APPNAME = "lastf"

options = OpenStruct.new
options[:pattern] = "*"
options[:type] = "f"

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: #{APPNAME} [options]"

  opts.separator "Specific options:"

  opts.on("-p", "--pattern [PATTERN]",
          "Pattern to de-space.") do |pattern|
    options.pattern = pattern
  end
  
  opts.on("-t", "--type [PATTERN]",
          "Types of file") do |type|
    options.type = type
  end
  
  opts.on("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end

opt_parser.parse(ARGV)

awk_part = "awk '{ s = \"\"; for (i = 9; i <= NF; i++) s = s $i \" \" ; print s }'"

command = "find . -name '#{options.pattern}' -type #{options.type} -depth 1"
# puts command.green
files = `#{command}`.to_s.split("\n")

# puts "files: #{files}"

files.each do |filename|
  if /\ /.match(filename)
    newfile = filename
    ['    ', '   ', '  '].each do |pattern|
      newfile = newfile.gsub(pattern, ' ')
    end

    [' - ', ' ', '(', ')'].each do |pattern|
      newfile = newfile.gsub(pattern, '-')
    end

    command = "mv -i \"#{filename}\" #{newfile}"
    puts command.green
    system(command)
  end
end
