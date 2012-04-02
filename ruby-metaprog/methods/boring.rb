require './data_source.rb'

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def mouse
    info = @data_source.get_mouse_info(@id)
    price = @data_source.get_mouse_price(@id)
    result = "Mouse: #{info} (#{price})"
    p result
  end

  def cpu
    info = @data_source.gt_cpu_info(@id)
    price = @data_source.get_cpu_price(@id)
    result = "CPU: #{info} (#{price})"
    p result
  end
  
  def keyboard
    info = @data_source.get_keyboard_info(@id)
    price = @data_source.get_keyboard_price(@id)
    result = "Keyboard: #{info} (#{price})"
    p result
  end

end

c = Computer.new("pc1", DataSource.new)
c.mouse
