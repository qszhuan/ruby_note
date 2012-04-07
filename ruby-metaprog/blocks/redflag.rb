def event(name)
  puts "ALERT: #{name}" if yield
end

Dir.glob('*events.rb').each { |file| load file}
