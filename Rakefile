require 'rubygems'
require 'rake'

begin
  gem 'jeweler', '~> 1.4'
  require 'jeweler'

  Jeweler::Tasks.new do |gem|
    gem.name        = 'dm-is-voteable'
    gem.summary     = 'DataMapper plugin for easy vote accepting models'
    gem.description = gem.summary
    gem.email       = 'brian.o.pearce [a] gmail [d] net'
    gem.homepage    = 'http://github.com/brianp/%s' % gem.name
    gem.authors     = [ 'Brian Pearce' ]
    gem.has_rdoc    = 'yard'

    # gem.rubyforge_project = 'datamapper'


    # gem.add_development_dependency 'rspec', '~> 1.3'
  end

  Jeweler::GemcutterTasks.new

  FileList['tasks/**/*.rake'].each { |task| import task }
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end
