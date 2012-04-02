# -*- coding: utf-8 -*-

num = 81

6.times do 
  puts "#{num.class}(#{num.size}): #{num}"
  num *= num
end


#区间作为序列
digits = 0..9
puts digits.include?(5)
puts digits.min()
puts digits.max()
puts digits.reject { |i| i < 5 }
puts digits.each {|digit| puts (digit)}

#区间作为条件
f = File.open('block.rb', 'r')
while line = f.gets()
  puts line if line =~ /def/ .. line =~ /end/
end
f.close()

# ranges as intervals
puts (1..10) === 5

r = 1...10
puts r.max()
