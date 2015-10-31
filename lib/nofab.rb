#!/usr/bin/env ruby

# Template for Ruby command-line tool

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
require 'colorize'
require 'date'

APPNAME = "nofap"

options = OpenStruct.new
options[:pattern] = "*"

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: #{APPNAME}"

  opts.separator "\nSpecific options:"

  opts.on("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end

opt_parser.parse(ARGV)


start = Date.new(2015, 10, 27)
today = Date.today()

gap = (today - start).to_i

puts gap
