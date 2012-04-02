class Roulette
  def method_missing(name, *args)
    
    person = name.to_s.capitalize
    super unless %w[Bob Frank Bill].include? person
    number = 0
    3.times do
      number = rand(10) +1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

n = Roulette.new
puts n.bob
