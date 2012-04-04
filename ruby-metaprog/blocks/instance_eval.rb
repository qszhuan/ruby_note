class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new
obj.instance_eval do  # This block is called context probe.
  p self
  p @v
end

v = 2
obj.instance_eval{ @v = v}
obj.instance_eval{ p @v}
obj.instance_exec(3) { |arg| @v = arg; p @v}


# Clean Room

