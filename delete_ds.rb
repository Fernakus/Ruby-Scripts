#!/usr/bin/env ruby

require 'find'

# Ask the user whether to use the current directory or enter a path
print "Do you want to use the current directory? (Y/N): "
use_current_directory = gets.chomp.downcase

if use_current_directory == 'y'
  start_directory = Dir.pwd
else
  # Ask the user for the directory path
  print "Enter the path to the directory: "
  start_directory = gets.chomp
end

# Use the Find module to locate all .DS_Store files recursively
Find.find(start_directory) do |file|
  if File.file?(file) && File.basename(file) == '.DS_Store'
    File.delete(file)
    puts "Deleted #{file}"
  end
end

puts 'All .DS_Store files have been deleted.'
