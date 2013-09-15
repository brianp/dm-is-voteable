require 'spec_helper'

describe Voteable::Vote do

  subject { @model.vote }

  before do
    Voteable::Vote.destroy
    @model = TestModel.create
  end

  it 'returns voteable' do
    subject.voteable.must_equal @model
  end

  it 'validates with a proc' do
    subject.saved?.must_equal true
    @model.vote('Brian').saved?.must_equal true
    @model.vote('Brian').saved?.must_equal false
  end

  it 'errors include last_vote_time' do
    subject.saved?.must_equal true
    @model.vote('Brian')
    @model.vote('Brian').errors.keys.must_include :last_vote_time
  end

  it 'errors with message' do
    subject.saved?.must_equal true
    @model.vote('Brian')
    @model.vote('Brian').errors.values.must_include ['You have already voted']
  end
end
