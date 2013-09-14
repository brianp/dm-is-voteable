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

  it 'errors include time_between_votes' do
    subject.saved?.must_equal true
    @model.vote('Brian')
    @model.vote('Brian').errors.keys.must_include :time_between_votes
  end

  it 'errors with message' do
    subject.saved?.must_equal true
    @model.vote('Brian')
    @model.vote('Brian').errors.values.must_include ['You have already voted']
  end
end
