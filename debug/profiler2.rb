require 'profile'

count = 0

words = File.read("/usr/share/dict/words")

count = words.scan(PATT=/^............\n/).size
puts "#{count} twelve-character words"
