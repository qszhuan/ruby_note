require 'profile'

count = 0
words = File.open('/usr/share/dict/words')

while word = words.gets
  word = word.chomp!
  if word.length == 12
    count += 1
  end
end

puts "#{count} twelve-character words"
