require 'spec_helper'

describe Voteable::Vote do

 subject { @model.vote }

 before do
   Voteable::Vote.destroy
   @model = TestModel.create
 end

 it 'returns voteable' do
   subject.voteable.id.must_equal @model.id
 end

end
