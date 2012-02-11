require 'net/http'

pages = %w{www.baidu.com www.ppurl.com www.google.com}

threads = []

pages.each do |page|
  threads << Thread.new(page) do |url|
    h = Net::HTTP.new(url, 80)
    puts "Fetching: #{url}"
    resp = h.get('/', nil)
    puts "Got #{url}: #{resp.message}"
  end
end

threads.each {|thread| thread.join}
