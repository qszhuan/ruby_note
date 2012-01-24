# -*- coding: utf-8 -*-
#Three ways to create regex
a = Regexp.new('^\s*[a-z]')
b = /^\s*[a-z]/
c = %r{^\s*[a-z]}

def show_regexp(a, re)
  if a =~ re
    puts  "#{re}:   #{$`}<<#{$&}>>#{$'}"
  else
    puts "#{re}:   no match"
  end
end

# show_regexp("abcde", a)

# ^  匹配行首
# $  匹配行尾
# \A 匹配字符串的开始
# \Z 匹配字符串的结尾(或以\n结尾，匹配\n之前)
# \z 匹配字符串的结尾
# \b 匹配词的边界
# \B 匹配非词的边界
show_regexp("this is\nthe time", /^th/)
show_regexp("this is\nthe time", /is$/)
show_regexp("this is\nthe time", /\Ath/)
show_regexp("this is\nthe time", /\Athe/)
show_regexp("this is\nthe time", /e\Z/)
show_regexp("this is\nthe time", /e\z/)
show_regexp("This is\nthe time", /\bi/)
show_regexp("This is\nthe time", /\Bi/)

show_regexp("banana", /an/)
show_regexp("banana", /(an)*/)
show_regexp("banana", /(an)/)
show_regexp("banana", /(an)+/)


a = "red ball blue sky"
show_regexp(a, /red|blue \w+/)
show_regexp(a, /(red|blue) \w+/)
show_regexp("the red angry sky", /red (ball|angry) sky/)

"12:50am" =~ /(\d\d):(\d\d)(..)/
puts "Hour is #$1, minute is #$2."
"12:50am" =~ /((\d\d):(\d\d))(..)/
puts "Time is #$1, hour is #$2, minute is #$3, AM/PM is #$4"

#Match duplicated letter
show_regexp('He said "Hello"', /(\w)\1/)
'He said "Hello"' =~ /(\w)\1/
puts $1, $2, $3

#Match duplicated substring
show_regexp("Mississippi", /(\w+)\1/)

'He said "Hello"' =~ /(["']).*?\1/
puts $1, $&

#P A T T E R N  B A S E D  S U B S T I T U T I O N 
a = 'the quich brown fox'
puts a.sub(/[aeiou]/, '*')
puts a.gsub(/[aeiou]/, '*')
puts a.sub(/\s\S+/, '')
puts a.gsub(/\s\S+/, '')
puts a.sub(/^./) {|match| match.upcase}
puts a.gsub(/[aeiou]/) { |vowel| vowel.upcase }

def mix_case(name)
  name.gsub(/\b\w/) { |first| first.upcase}
end

puts mix_case('happy new year')

puts 'thoughtworks'.gsub(/(.)(.)/, '\2\1')
puts 'thoughtworks'.gsub(/(.)/, '\1 ').upcase
puts 'qszhuan\thoughtworks\com'.gsub(/\\/, '\\\\')
puts 'qszhuan\thoughtworks\com'.gsub(/\\/, '\\\\\\')
puts 'qszhuan\thoughtworks\com'.gsub(/\\/, '\\\\\\\\')
puts 'qszhuan\thoughtworks\com'.gsub(/\\/, '\&\&')

# SUMMARY OF WILDCHAR
# \d  [0-9]              数字字符
# \D  [^0-9]             除数字之外的任何字符
# \s  [ \t\r\n\f]        空格字符
# \S  [^ \t\r\n\f]
# \w  [a-zA-z0-9_]       组词字符
# \W  [^a-zA-Z0-9_]
#-----POSIX CHARSET
# [:alnum:] 字母和数字
# [:alpha:] 大小写字母
# [:blank:] 空格和制表符
# [:cntrl:] 控制字符
# [:digit:] 数字
# [:graph:] 除了空格的可打印字符
# [:lower:] 小写字母
# [:print:] 任何可打印字符
# [:punct:] 除了空格和字母数字的可打印字符
# [:space:] 空格字符
# [:upper:] 大写字母
# [:xdigit:] 16进制数字

def unescapeHtml(string)
  str = string.dup
  str.gsub!(/&(\S+?);/n) {
    match = $1.dup
    case match
    when /\Aamp\z/ni then '&'
    when /\Aquot\z/ni then '"'
    when /\Agt\z/ni then '>'
    when /\Alt\z/ni then '<'
    when /\A#(\d+)\z/ni then Integer($1).chr
    when /\A#x([0-9a-f]+)\z/ni then $1.hex.chr
    end
  }
  str
end

puts unescapeHtml("1&gt;2 2&lt;3 5&amp;&6 7&quot; &100; &xff;")

#OBJECT-ORIENTED REGULAR EXPRESSION
re = /(\d+):(\d+)/
md = re.match("Time: 12:34am")
puts md.class
puts md[0]
puts md[1]
puts md[2]
puts md.pre_match
puts md.post_match
