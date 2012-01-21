# -*- coding: utf-8 -*-

#类型首字母大写
class Song

  #对象创建后，用于初始化对象的值
  def initialize name, artist, duration
    #实例变量前面加@， 局部变量和参数变量首字母小写
    @name = name
    @artist = artist
    @duration = duration
  end

  #覆盖默认的to_s方法
  def to_s
    # ‘#'可以把实例变量插入字符串
    "Song: #@name--#@artist(#@duration)"
  end

end

#---------------
song = Song.new "You are beautiful", "Unknown", 12
puts song.inspect
puts song.to_s


class KaraokeSong < Song

  def initialize name, artist, duration, lyrics
    super name, artist, duration
    @lyrics = lyrics
  end
end

song = KaraokeSong.new("故乡", "许巍", 4, "lyrics")
puts song.inspect
puts song

#向类添加一个方法
class KaraokeSong
  def to_s
    #当调用super且不加参数时，ruby向父类发送消息，要求调用父类中的同名方法
    super + "[#@lyrics]"
  end
end
puts song

class KaraokeSong
  #创建读变量的属性
  attr_reader :name, :artist, :duration
end
puts song.name

class KaraokeSong
  #创建可写属性
  #更快捷的方式是用attr_writer
  def lyrics= lyrics
    @lyrics = lyrics
  end
end

song.lyrics = "new setted lyrics"
puts song

class PlaySong < Song
  attr_reader :duration

  #类变量
  @@play = 0

  def initialize name, artist, duration
    super name, artist, duration
    @play = 0
  end

  def play
    @play += 1
    @@play += 1
    puts "This song: #@play plays. Total #@@play plays"
  end  
end

song = PlaySong.new "ZD", "ZD", 12
song.play
song.play
song2 = PlaySong.new "", "", 400
song2.play

class SongList
  MAX_TIME = 5 * 60

  #类方法
  def SongList.is_to_long(song)
    song.duration > MAX_TIME
  end
end
puts song.inspect
puts SongList.is_to_long(song)
puts SongList.is_to_long(song2)

#singleton模式
class Logger
  private_class_method :new
  @@logger = nil

  def Logger.create
    @@logger = new unless @@logger
    @@logger
  end
end

#访问控制
class MyClass
  #默认public
  def method1
  end

  protected 
  def method2
  end

  private
  def method3
  end

  #或者
  public :method1
  protect :method2
  private :method3
end
a = MyClass.new
a.method1

class Caller < MyClass
  def call_protect myclass
    myclass.method2
  end
end

caller = Caller.new
caller.call_protect a

