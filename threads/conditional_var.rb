# -*- coding: utf-8 -*-
#在线程之间交换事件
require 'monitor'

SONGS = [
         '卖报歌',
         '小毛驴',
         '听妈妈讲过去的故事',
         '童年',
         '拾稻穗的小姑娘',
         '让我们荡起双桨'
]

START_TIME = Time.now

def timestamp
  (Time.now - START_TIME).to_i
end

#
def get_customer_request
  sleep(5*rand)
  song = SONGS.shift
  puts "#{timestamp}: requesting #{song}" if song
  song
end

def play(song)
  puts "#{timestamp}: Playing #{song}"
  sleep(5 + 10*rand)
end

ok_to_shutdown = false
playlist = []
playlist.extend(MonitorMixin)

play_pending = playlist.new_cond

#用户请求线程
customer = Thread.new  do

  loop do
    req = get_customer_request
    break unless req
    playlist.synchronize do
      playlist << req
      play_pending.signal
    end
  end
end

#用户线程
player = Thread.new do
  loop do
    song = nil
    playlist.synchronize do
      break if ok_to_shutdown && playlist.empty?
      play_pending.wait_while { playlist.empty? }
      song = playlist.shift
    end
    break unless song
    play(song)
  end
end

customer.join
ok_to_shutdown = true
player.join

    
