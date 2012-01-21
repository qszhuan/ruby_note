# -*- coding: utf-8 -*-

person = "Jim"
puts person.object_id
puts person[0]
puts person
puts person.class

shadow = person
puts shadow.object_id
puts person.inspect
puts shadow.inspect

#拷贝新对象
person2 = person.dup
puts person2.object_id

#使对象不可修改
person.freeze
