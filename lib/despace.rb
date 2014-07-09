#!/usr/bin/env ruby

# `lastf`` displays the N last-modified files matching the specified search-term.

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'

APPNAME = "lastf"

options = OpenStruct.new
options[:pattern] = "."

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: #{APPNAME} [options]"

  opts.separator "Specific options:"

  opts.on("-p", "--pattern [PATTERN]",
          "Pattern to de-space.") do |pattern|
    options.pattern = pattern
  end
  
  opts.on("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end

opt_parser.parse(ARGV)

awk_part = "awk '{ s = \"\"; for (i = 9; i <= NF; i++) s = s $i \" \" ; print s }'"

# NEED TO CHANGE THIS TO A FIND COMMAND - LEARN HOW TO USE FIND!
command = "ls *\" \"* | tail +1 | grep #{options.pattern}"

files = `#{command}`.to_s.split("\n")

files.each do |filename|
  newfile = filename.gsub(" ", "-").gsub("(", "-").gsub(")", "-")
  system("mv -i \"#{filename}\" #{newfile}")
end