def event(name, &block)
  @events[name] = block
end

def setup(&block)
  @setups << block
end

Dir.glob('*events.rb').each do |file|
  @setups = []
  @events = {}
  load file
  @events.each_pair do|name, event|
    env = Object.new
    @setups.each do |setup|
      env.instance_eval(&setup)
    end
    puts "ALERT: #{name}" if env.instance_eval(&event)
  end
end
