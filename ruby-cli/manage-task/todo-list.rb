#!/usr/bin/env ruby
File.open("todo.txt", "r") { |file| 
	counter = 1
	file.readlines.each { |line| 
		name, created, completed = line.chomp.split(/,/)
		printf("%3d - %s\n", counter, name)
		printf("	created 	: %s\n", created)
		unless completed.nil?
			printf(" 	Completed : %s\n", completed)
		 end 
		 counter += 1
	}
}