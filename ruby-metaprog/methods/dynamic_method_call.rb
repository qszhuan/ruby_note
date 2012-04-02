class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
end

obj = MyClass.new
p obj.my_method(2)
p obj.send(:my_method, 2)
p obj.send("my_method", 2)

p 1.send(:+, 2)

p :+.class
p Symbol.class
p Symbol.instance_variables
p Symbol.instance_methods
