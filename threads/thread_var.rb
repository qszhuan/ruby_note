
count = 0    #can be accessed by all thread in the scope.
threads = []

10.times do |i|
  threads[i] =  Thread.new do
    sleep(rand(0.1))
    Thread.current['mycount'] = count
    count += 1
  end
end

threads.each { | t| t.join; print t['mycount'], " ,"}
puts "count = #{count}"
