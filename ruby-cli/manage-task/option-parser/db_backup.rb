#!/usr/bin/env ruby
# Bring OptionParser into the namespace
require 'optparse'
options = {}

option_parser = OptionParser.new do |opts|

  # Create a switch
  opts.on("-i","--iteration") do options[:iteration] = true
  end

  # Create a flag
  opts.on("-u USER") do |user| 
    unless user =~ /^.+\..+$/
      raise ArgumentError, "User name must be in 'first.last' format"
    end
    options[:user] = user
  end

  opts.on("-p PASSWORD") do |password| options[:password] = password
  end 
end

option_parser.parse!

puts options.inspect
