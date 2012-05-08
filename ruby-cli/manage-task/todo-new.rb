#!/usr/bin/env ruby

new_task = ARGV.shift

File.open('todo.txt', "a") { |file|
	file.puts "#{new_task}, #{Time.now}"
	puts "Task added."  
}