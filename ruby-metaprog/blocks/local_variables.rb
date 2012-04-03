def my_method 
  yield
end

top_level_var = 1

my_method do
  top_level_var +=1 # outer scope variable
  local_var = 1
end

def my_method2
  top_level_var =1 # local variable in method
  p top_level_var
end

my_method do |top_level_var| # warning for shadowing outer local variable
  top_level_var = 10  #local variable in block 
end

my_method2
p top_level_var
