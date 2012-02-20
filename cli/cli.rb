# -*- coding: utf-8 -*-

puts "name: #{$0}"
puts ARGV.length

ARGV.each do |arg|
  p arg
end


#环境变量
p ENV['SHELL']
p ENV["HOME"]
p ENV['USER']
p ENV.keys.size

ENV.each do |key, value|
  puts "#{key} : #{value} "
end


#写入环境变量，只在当前进程及子进程
puts "In parent, term = #{ENV['TERM']}"
fork do
  puts "Start of child 1, term = #{ENV['TERM']}"
  ENV['TERM'] = 'child1'
  fork do
    puts "start of child 2, term = #{ENV['TERM']}"
  end
  Process.wait
  puts "End of child 1, term = #{ENV['TERM']}"
end
Process.wait
puts "back in parent, term = #{ENV['TERM']}"

#搜索路径
puts $:


#CONFIG
require 'rbconfig'
include Config
p CONFIG['host']
p CONFIG['libdir']

CONFIG.each do |key,value|
  puts "#{key} : #{value} "
end
