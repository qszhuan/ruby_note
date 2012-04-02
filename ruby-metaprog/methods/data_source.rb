# -*- coding: utf-8 -*-
class DataSource
  def initialize
    #caller[0]=~/`(.*?)'/  # note the first quote is a backtick
     #   p "#{self}: #$1"
     p __callee__
     #    p __method__
  end

  def get_mouse_info(workstation_id)
    p __callee__
  end
  
  def get_mouse_price(workstation_id)
    p __callee__
  end
  
  def get_keyboard_info(workstation_id)
    p __callee__
  end
  
  def get_keyboard_price(workstation_id)
    p __callee__
  end
  
  def get_cpu_info(workstation_id)
    p __callee__
  end
  
  def get_cpu_price(workstation_id)
    p __callee__
  end
  
  def get_display_info(workstation_id)
    p __callee__
  end
  
  def get_display_price(workstation_id)
    p __callee__
  end
  
end

# ds = DataSource.new
# ds.get_cpu_info(1)
# p ds.methods
