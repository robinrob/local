#!/usr/bin/env ruby

require 'colorize'

name = ARGV[0]

processes = `ps aux | grep #{name} | awk '{print $2}' | xargs`.split(' ')

puts processes.inspect

processes.each do |process|
  `kill #{process} 2> /dev/null`
end