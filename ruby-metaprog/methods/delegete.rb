require 'delegate'

class Assistant
  def initialize(name)
    @name = name
  end

  def read_email
    "(#{@name}) It's mostly spam."
  end

  def check_schedule
    "(#{@name}) You have a meeting today."
  end
end

class Manager < DelegateClass(Assistant)
  def initialize(assistant)
    super(assistant)
  end
  
  def attend_meeting
    "Please hold my call."
  end
end

frank = Assistant.new("Frank")
anne = Manager.new(frank)
p anne.attend_meting
p anne.read_email
p anne.check_schedule
