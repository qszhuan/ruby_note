# -*- coding: utf-8 -*-
#类的继承关系
class MyClass
  def my_method
    @v = 1
  end
end

p MyClass.instance_methods(false)
p Class.instance_methods(false)

p MyClass.superclass # => Object
p Class.superclass # => Module
p Module.superclass # => Object
p Object.superclass # => nil (ruby 1.8.7)


p MyClass.ancestors
p Class.ancestors
p Object.ancestors
p Module.ancestors

p Kernel.class # => Module
p Object.class # => Class
p MyClass.class # => Class
p Module.class # => Class

#探究Module的继承结构
module MyModule
  def mo_method
  end
end

p MyModule.ancestors # => [MyModule]
p MyModule.methods
p MyModule.class.instance_methods
p MyModule.class.methods
p MyModule.class # => Module
# p MyModule.superclass # NO superclass method
