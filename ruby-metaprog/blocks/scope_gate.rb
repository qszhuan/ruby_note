require 'test/unit'

# Three Scope Gate
# 1 class 
# 2 module
# 3 def
###########################################################
# H O W    T O    F L A T T I N G    T H E    S C O P E
###########################################################
# a) global scope variables
#---------------------------------------------------------
def a_scope
 $var = "a global var"
end

def b_scope
  p $var
end

a_scope
b_scope

# b)top-level instance variable
#---------------------------------------------------------
@var2 = "The top level @var"
def my_method
  p @var2
end
my_method

# c) Class.new()
#---------------------------------------------------------
my_var = "success"
MyClass = Class.new do
  p "#{my_var} in class scope"
  def my_method
  end
end

# d) Module#define_method()
#---------------------------------------------------------
class MyClass
  my_var = "inclass"
  define_method :my_method2 do
    p "#{my_var} in class scope"
  end
  def m
    p my_var
  end
end

MyClass.new.my_method2
class Testscope < Test::Unit::TestCase
  def test_scope
    assert_raises(NameError){
      MyClass.new.m
    }
  end
end

# e) shared scope
#---------------------------------------------------------
def define_methods
  shared = 0
  
  Kernel.send :define_method, :counter do
    shared
  end
  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end

define_methods
p counter
p inc(4)
p counter
