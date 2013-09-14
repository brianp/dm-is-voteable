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
end
