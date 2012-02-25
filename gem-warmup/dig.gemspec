require 'rubygems'
#gem build 
SPEC = Gem::Specification.new do |s|
  s.name  = "DIG"
  s.version = "1.0.0"
  s.author = "Zhuan Qingshan"
  s.email = "zhuanqingshan@163.com"
  s.homepage = "http://www.douban.com/accounts/zhuanqs"
  s.platform = Gem::Platform::RUBY
  s.summary = "An intresting tool to traversal graph"
  candidates = Dir.glob(".")
  s.files = candidates.delete_if do |item|
    item.include?("CVS") || item.include?("rdoc")
  end
  s.require_path = "lib"
  s.autorequire = "dig"
  s.test_file = "test/ts_dig.rb"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]
  s.add_dependency("BlueCloth",">=0.0.4")
end
