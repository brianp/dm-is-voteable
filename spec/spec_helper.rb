require 'bundler/setup'
Bundler.require(:test)

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/setup'
require 'date'

DataMapper.setup(:default, { :adapter => :in_memory })

require 'dm-is-voteable'

class TestModel
  include DataMapper::Resource

  property :id, Serial

  is_voteable(last_vote_time: ->{ Date.today - 3 })
end

DataMapper.finalize
