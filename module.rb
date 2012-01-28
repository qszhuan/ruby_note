# -*- coding: utf-8 -*-
# 1.提供命名空间防止命名冲突
# 2.实现了mixin功能

#NAMESPACE
module Trig
  PI = 3.1415926
  def Trig.sin(x)
  end
  def Trig.cos(x)
  end
end

module Moral
  VERY_BAD = 0
  BAD = 1
  def Moral.sin(badness)
  end
end

#if in another file 
#require 'trig'
#require 'moral'
y = Trig.sin(Trig::PI/4)
wrongdoing = Moral.sin(Moral::VERY_BAD)


#mixin
module Debug
  def who_am_i?
    "#{self.class.name}(\##{self.object_id}):#{self.to_s}"
  end
end

class Phonograph
  include Debug
  def initialize(name)
    @name = name
  end
  def to_s
    @name
  end
end

class EightTrack
  include Debug
  def initialize(name)
    @name = name
  end
  def to_s
    @name
  end
end

ph = Phonograph.new("West End Blue")
et = EightTrack.new("Surealistic Pillow")

puts ph.who_am_i?
puts et.who_am_i?


class VowelFinder
  include Enumerable

  def initialize(string)
    @string = string
  end
  def each
    @string.scan(/[aeiou]/) do |vowel|
      yield vowel
    end
  end
end

vf = VowelFinder.new('thoughtworks.china')
puts vf.inject{|v,n| v+n}

#use another module encapsulate the inject operation
module Summable
  def sum
    inject { |v, n| v+n}
  end
end

class Array
  include Summable
end

class Range
  include Summable
end

class VowelFinder
  include Summable
end

puts [1,2,3,4,5].sum
puts ('a' ... 'm').sum
puts vf.sum

