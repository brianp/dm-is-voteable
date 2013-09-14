require 'bundler/setup'
Bundler.require(:test)

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/setup'

DataMapper.setup(:default, { :adapter => :in_memory })

require 'dm-is-voteable'

class TestModel
  include DataMapper::Resource

  property :id, Serial

  is_voteable
end

DataMapper.finalize
