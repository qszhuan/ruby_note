# -*- coding: utf-8 -*-
#未处理的异常会简单的杀死当前线程，其他的线程会继续运行
threads = []
4.times do |number|
  threads << Thread.new(number) do |i|
    raise "Boom~" if i  == 2
    print "#{i}\n"
  end
end

#threads.each { |t| t.join}
threads.each { |t| 
  begin
    t.join
  rescue RuntimeError => e   #能rescue异常
    puts "Failed: #{e.message}"
  end
}

Thread.abort_on_exception = true #会杀死所有运行的进程，如果一个线程异常退出。
threads = []
4.times do |t|
  threads << Thread.new(t) do |i|
    raise "Boom##" if i == 2
    print "#{i}\n"
  end
end

threads.each { |t| t.join}
