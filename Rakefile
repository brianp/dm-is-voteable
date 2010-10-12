require 'rubygems'  
require 'rake'  
require 'echoe'  
  
Echoe.new('dm-is-voteable', '0.0.4') do |p|  
  p.description     = "Makes a model voteable"
  p.url             = "http://github.com/brianp/dm-is-voteable"  
  p.author          = "Brian Pearce"  
  p.email           = "brian.o.pearce@gmail.com"  
  p.ignore_pattern  = ["tmp/*", "script/*"]  
  p.development_dependencies = []  
end  
  
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }