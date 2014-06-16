# #!/usr/bin/env ruby
# 
# # `lastf`` displays the N last-modified files matching the specified search-term.
# 
# require 'optparse'
# require 'optparse/time'
# require 'ostruct'
# require 'pp'
# 
# 
# options = OpenStruct.new
# options[:file] = nil
# 
# opt_parser = OptionParser.new do |opts|
#   opts.banner = "Usage: lastf [options]"
# 
#   opts.separator ""
#   opts.separator "Specific options:"
# 
#   opts.on("-f", "--file [FILE]",
#           "File containing todo list.") do |file|
#     options.file = file
#   end
#   
#   opts.on("-h", "--help", "Show this message") do
#     puts opts
#     exit
#   end
# end
# 
# opt_parser.parse(ARGV)
# 
# CSV.foreach(options.file, :headers => true) do |csv_obj|
# 
#   csv_obj[QUESTION_COL],
#   answer=csv_obj[ANSWER_COL].split(MULTI_ANSWER_DELIMITER),
#   marked=marked,
#   score=csv_obj[SCORE_COL])#!/usr/bin/env ruby
# 

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