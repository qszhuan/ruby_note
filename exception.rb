# -*- coding: utf-8 -*-

#
begin 
  eval string
rescue SyntaxError, NameError => boom
  print "String doesn't compile: " + boom
rescue StandardError => bang
  print "Error running script: " + bang
end
puts
#Tidying up
f = File.open('exception.rb') 
begin
  dd
rescue
  print "handle error."
ensure
  f.close unless f.nil?
  print "ensure excuted."
end

def prompt_and_get(prompt)
  puts prompt
  res = readline.chomp
  throw :quit_requested if res == "!"
  puts res
end

catch :quit_requested  do 
  name = prompt_and_get("Name: ")
  age = prompt_and_get("Age: ")
  sex = prompt_and_get("Sex: ")
end

