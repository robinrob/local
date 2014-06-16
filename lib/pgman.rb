#!/usr/bin/env ruby

require 'colorize'

outfile = "postgres.pdf"
outpath = "#{ENV['DOCUMENTS_HOME']}/#{outfile}"
outpath_escaped = outpath.gsub(/ /){ "\\ " }

if !File.file?("#{outpath}")
  puts "Downloading manual ...".green
  
  system("wget http://www.postgresql.org/files/documentation/pdf/9.3/postgresql-9.3-A4.pdf -O #{outpath_escaped}")
end

puts "Opening manual ...".green
system("open #{outpath_escaped}")