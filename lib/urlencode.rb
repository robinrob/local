#!/usr/bin/env ruby

require 'open-uri'

str = ARGV.join(" ").force_encoding('ASCII-8BIT')
puts URI::encode(str)