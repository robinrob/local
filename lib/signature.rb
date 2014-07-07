#!/usr/bin/env ruby

names = ['Robin', 'Alberto', 'Gabriel', 'Petr', 'Allen', 'Sean']
names.shuffle(random: Random.new(Time.now().to_i % 13331123))

sig = names[0..-2].join(', ')

sig << " & #{names[-1]}"

puts sig