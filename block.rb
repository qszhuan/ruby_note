# -*- coding: utf-8 -*-

#调用方法中用yield来调用相关联的block
def call_block
  puts "Start of method"
  yield
  yield
  puts "End of method"
end

call_block { puts "In this block" }

#对yield传入参数将参数传递给block
def call_block_with_args
  yield "hello", "jim"
end

call_block_with_args do | greeting, name |
  puts greeting, name
end

#调用方法获取block的返回值
def get_block_return_value
  puts yield
end

get_block_return_value { true }

#事务与block
class File
  def File.open_and_process(*args)
    f = File.open(*args)
    yield f
    f.close()
  end
end

File.open_and_process('block.rb', 'r') do |file|
  while line = file.gets()
    puts line
  end
end
