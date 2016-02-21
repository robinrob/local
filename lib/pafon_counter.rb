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


date_str = `cat ~/.pafonrc`

start = Date.strptime(date_str, '%Y-%m-%d')
today = Date.today()

gap = (today - start).to_i
weeks = gap / 7


if weeks < 1
then
  col = :red
elsif weeks < 2
  col = :yellow
elsif weeks < 3
  col = :green
elsif weeks < 4
  col = :blue
elsif weeks < 13
  col = :light_white
end

puts gap.to_s.send(col)
