# -*- coding: utf-8 -*-
def to_alphanumerics(s)
  s.gsub( /[^\w\s]/, '')
end

require 'test/unit'
class ToAlphanumbericTest < Test::Unit::TestCase
  def test_strips_non_alphanumeric_characters
    assert_equal '3 the Magic Number', to_alphanumerics('#3, the *Magic, Number*?')
  end
end

#打开类：把方法植入String类
#给类添加新方法
class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end


class StringExtensionTest < Test::Unit::TestCase
  def test_strips_non_alphanumeric_characters
    assert_equal '3 the Magic Number', '#3, the *Magic, Number*?'.to_alphanumeric
  end
end

#打开类：理解打开的含义：核心任务是把定义类的上下文，让你可以在其中定义方法

3.times do #并不是定义3个C类
  class C
    puts "Hello"
  end
end

class D
  def x
    'x'
  end
end
class D
  def y
    'y'
  end
end

obj = D.new
p obj.x
p obj.y

