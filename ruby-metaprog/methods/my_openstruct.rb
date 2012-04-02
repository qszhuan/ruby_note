class MyOpenStruct
  def initialize
    @attributes = {}
  end

  def method_missing(name, *args)
    attribute = name.to_s
    p attribute
    if attribute =~ /=$/
      @attributes[attribute.chop] = args[0]
    else
      @attributes[attribute]
    end
  end
end

icecream = MyOpenStruct.new
p icecream.flavor = 'vanilla'
p icecream.shape = "unknown"
