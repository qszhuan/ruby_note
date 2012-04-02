class Lawyer
  def method_missing(method, *args)
    p "You called: #{method}(#{args.join(', ')})"
    p "(You also passed it a block)" if block_given?
  end
end

bob = Lawyer.new
bob.talk_simple('a', 'b') do
  #block
end
