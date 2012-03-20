# -*- coding: utf-8 -*-
#任何以大写字母开头的引用(包括类名和模块名), 都是常量

module MyModule
  MyConstant = 'Outer constant'
  class MyClass
    MyConstant = 'Inner constant'
  end
end

#类似目录树
p MyModule::MyConstant
p MyModule::MyClass::MyConstant
p ::MyModule::MyClass::MyConstant

p Module.methods
p MyModule.constants
p Module.constants
