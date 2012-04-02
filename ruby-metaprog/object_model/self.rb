# -*- coding: utf-8 -*-

def pself()
  p "class: #{self.class}, self: #{self}, object id: #{self.object_id}"
end
pself

class A
  #self of class A
  pself
  def method()
    pself
  end

end

#instance's self
a = A.new
a.method

