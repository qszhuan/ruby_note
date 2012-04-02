# -*- coding: utf-8 -*-
#在ascii码前加？可以获取其整数值
p ?a

#Ctrl+x的组合键， 为x & 0x9f 的值
p ?\C-

p ?\C-x
puts ?\C-a

#Meta+x, 为x & 0x80 的值
puts ?\M-

puts ?\M-a

# quote 
p 'hello'
puts 'hello'
p 'a backslash \'\\\''
puts 'a backslash \'\\\''
p %q/simple string/
p %q{a (bad) idea}
p %q no_blank_here ;

# double quote
a = 123
p "\123mile"
p "Say \"Hello\""

p %Q!"I said 'nuts', " i said!

#字符串字面量被用作赋值语句或作为参数时，一个新的string对象将被创建
3.times do 
  print "hello".object_id, " "
end
