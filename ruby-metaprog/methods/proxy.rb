require './data_source.rb'

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name, *args)
    super if !@data_source.respond_to?("get_#{name}_info")
    info = @data_source.send("get_#{name}_info", args[0])
    price = @data_source.send("get_#{name}_price", args[0])
    result = "#{name.to_s.capitalize}: #{info} ($#{price})"
    p result
  end

  def respond_to?(method)
    @data_source.respond_to?("get_#{method}_info") || super
  end

  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|method_missing|respond_to?/
  end
end

c = Computer.new(42, DataSource.new)
c.cpu
p c.respond_to?(:mouse)
c.display
p Object.instance_methods.grep(/^d/)
