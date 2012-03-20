# -*- coding: utf-8 -*-
#类中有什么
class MyClass
  def my_method
    @v = 1
  end
end

obj = MyClass.new

#类和实例变量没关系，实例变量存放在对象中
#对象调用的方法在类上，叫类的实例方法，通过创建类的对象来访问
p obj.instance_variables
obj.my_method
p obj.instance_variables

p obj.methods
p MyClass.instance_methods

p MyClass.methods

#类自身也是对象
p obj.class
p obj.object_id
p MyClass.class
p MyClass.class.object_id
p Class.class
p Class.class.object_id

#
inherited = false
p MyClass.instance_methods(inherited) # => ["my_method"]
p Class.instance_methods(inherited)   # => ["superclass", "allocate", "new"] 

c = Class.new
p c.instance_variables # => []

p c.methods
p Class.methods

