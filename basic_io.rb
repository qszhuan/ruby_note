# -*- coding: utf-8 -*-
#Simulate File.open
# class File
#   def File.open(*args)
#     result = f = File.new(*args)
#     if block_given?
#       begin 
#         result = yield f
#       ensure
#         f.close
#       end
#     end
#     return result
#   end
# end

File.open('testfile', 'r') do |file|
  puts file.readlines()
end

#char
File.open('testfile', 'r') do |file|
  file.each_byte {|ch| putc ch; print '.'}
end

#line
File.open('testfile', 'r') do |file|
  file.each_line { |line| puts "Got #{line.dump}"}
end

#customize line seperator
File.open('testfile', 'r') do |file|
  file.each_line('e') {|line| puts "Got #{line.dump}"}
end

#Iterator
IO.foreach("testfile") { |line| puts line}

#read into a string
str = IO.read("testfile")
puts str.length
puts str[0, 50]

#read into array
arr = IO.readlines('testfile')
puts arr.length
puts arr[3]


#WRITTING TO FILE

#二进制数存入字符串
str = '\001\002\003' # It's different with "
str1 = "\001\002\003"
str2 = ""
str2 << 1 << 2 << 3;
str3 = [1,2,3].pack("c*")
puts str1, str2, str3

#使用字符串IO
require 'stringio'
ip = StringIO.new("now is\nthe time\nto learn\nruby")
op = StringIO.new("", "w")
ip.each_line do |line|
  op.puts line.reverse
end
puts op.string

#Talking to networks
require 'net/http'
h = Net::HTTP.new('www.baidu.com', 80)
response = h.get('/index.html', nil)
if response.message == "OK"
  puts response.body.scan(/<img src="(.*?)"/m).uniq
end

#open uir
require 'open-uri'
open('http://www.pragprog.com') do |f|
  puts f.read.scan(/<img src="(.*?)"/m).uniq
end

