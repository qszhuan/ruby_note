#!/usr/bin/env ruby

TODO_FILE = 'todo.txt'

#write to todo file
def write_todo(file,name,created=Time.now, completed=nil)
	file.puts("#{name},#{created},#{completed}")
end

#read todo file
def read_todo(line)
	line.chomp.split(/,/)
end


command = ARGV.shift
#exec
case command
when 'new'
	new_task = ARGV.shift
	File.open(TODO_FILE, "a") do |file| 
		write_todo(file, new_task)
		puts "Task added."
	end
when 'list'
	File.open(TODO_FILE, 'r') do |file|
		counter = 1
		file.readlines.each do |line|
			name, created, completed = read_todo line
			printf "%3d	-	%s\n", counter, name
			printf "	Created: 	%s\n", created
			unless completed.nil?
				printf "	Completed: 	%s\n", completed
			end
			counter += 1
		end
	end
when 'done'
	task_number = ARGV.shift.to_i
	File.open(TODO_FILE, "r") do |file|
		File.open('todo.txt.new', 'w') do |newfile|
			counter = 1
			file.readlines.each do |line|
				name,created,completed = read_todo line
				puts "#{counter}, #{task_number}"
				if task_number == counter
					write_todo newfile, name, created, Time.now
					puts "Task #{task_number} completed"
				else
					write_todo newfile, name, created, completed
				end
				counter += 1
			end
		end
	end
	system 'ls'
	system 'mv todo.txt.new t'
end