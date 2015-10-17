#!/usr/bin/env ruby

# Template for Ruby command-line tool

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
require 'colorize'

APPNAME = "lastf"

options = OpenStruct.new
options[:pattern] = "*"

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

require 'date'
require 'date_mixin'
require 'lib/log'


Log.put "Date.new(2001,2,3)"