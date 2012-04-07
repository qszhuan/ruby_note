
# Three ways to pack code
inc = Proc.new { |x| x + 1}
p inc.call(2)
p inc.class

dec = lambda{ |x| x - 1 }
p dec.call(2)
p dec.class

abs = proc{|x| if x < 0; x * (-1); end}
p abs.call(-2)
p abs.class

# &
def math(a,b)
  yield(a,b)
end

def teach_math(a,b, &operation)
  puts "Let's do the match."
  operation.call(a,b)
  yield(a,b)
  math(a,b, &operation)
end

teach_math(1,2) { |a,b| p a+b}


# proc lambda return
def double(callable_obj)
  callable_obj.call * 2
end

l = lambda { return 10}
p double(l)

def another_double
  p = Proc.new {return 10}
  result = p.call
  return result * 2
end
p another_double

