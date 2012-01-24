#COMMAND EXPANSION
puts `ls`
puts %x{echo "Hello there"}

#REDEFINE BACK QUOTE

alias old_backquote `

def `(cmd)
  result =   old_backquote(cmd)
  if $? != 0
    fail "Command #{cmd} failed: #$?"
  end
  result
end

print `date`
#print `data`

#ASSIGNMENT
a = b = 1+2+3
puts  a

class Test
  def val=(val)
    @val = val
    return 100 #will be discarded
  end
end

t = Test.new
a = t.val = 2
puts a


#PARARREL ASSIGNMENT
 a = 1
 b = 2
a,b = b,a
print a,b
a = [1,2,3,4]
b,c = a
print b,c

#if unless
#while until
#case when
#for in
#break redo next
File.open('expression.rb').grep(/^#/) do |line|
puts line
end

#RETRY
for i in 1..100
  print "Now at #{i}, restart?"
  retry if gets =~ /^y/i
end


