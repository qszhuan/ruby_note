system("tar cvf test.gz *.rb")
result = `date`
puts result

#Create pipe
pipe = IO.popen('-', 'w+')

if pipe
  pipe.puts "Got a job!"
  STDERR.puts "Child says: '#{pipe.gets.chomp}'"
else
  STDERR.puts "Dad says: '#{gets.chomp}'"
  puts "OK"
end

#independent children
# exec("sort test.gz > test.txt") if fork.nil?
# Process.wait

# pid = nil
# trap("CLD") do
#   pid = Process.wait
#   puts "Child pid #{pid}: terminated"
# end
# exec("sort test.gz > test.txt") if fork.nil?

# until pid 
#   print '.'
#   sleep 1
# end


###############PP
fork do
  puts "In child, pid = #$$"
  exit 99
end

pid = Process.wait
puts "Child terminated, pid= #{pid}, status=#{$?.exitstatus}"
