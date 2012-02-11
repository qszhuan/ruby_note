# -*- coding: utf-8 -*-
class Counter
  attr_reader :count
  
  def initialize
    @count = 0
  end

  def tick
    @count += 1
  end
end

c = Counter.new
def run(c)
  t1 = Thread.new { 100_000.times { c.tick }}
  t2 = Thread.new {  100_000.times { c.tick }}
  t1.join
  t2.join
  puts c.count
end

run(c)


# 用monitor 解决同步问题
#1 继承自Monitor
require 'monitor'
class Counter1 < Monitor
  attr_reader :count
  
  def initialize
    @count = 0
    super
  end

  def tick
    synchronize do
      @count += 1
    end
  end
end

run(Counter1.new)

#2 mixin Monitor
class Counter2
  include MonitorMixin
  attr_reader :count
  def initialize
    @count = 0
    super
  end
  def tick
    synchronize do
      @count += 1
    end
  end
end

run(Counter2.new)

#外部监视器
c = Counter.new
lock = Monitor.new
t1 = Thread.new { 100_000.times { lock.synchronize { c.tick }}}
t2 = Thread.new { 100_000.times { lock.synchronize { c.tick }}}
t1.join;t2.join
puts c.count

#把特定对象放入监视器
c = Counter.new
c.extend(MonitorMixin)
t1 = Thread.new { 100_000.times { c.synchronize { c.tick }}}
t2 = Thread.new { 100_000.times { c.synchronize { c.tick }}}
t1.join; t2.join
puts c.count
