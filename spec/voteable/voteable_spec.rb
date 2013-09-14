require 'spec_helper'

describe Voteable do
  subject { TestModel.create }

  before do
    Voteable::Vote.destroy
  end

  it 'adds the votes association' do
    subject.respond_to?(:votes).must_equal true
  end

  it 'creates a vote method to create single vote' do
    subject.vote
    Voteable::Vote.count.must_equal 1
  end

  it 'returns the vote' do
    subject.vote.class.must_equal Voteable::Vote
  end

  it 'accepts an identifier as a votes' do
    subject.vote('Brian')
    Voteable::Vote.first.voter.must_equal 'Brian'
  end

  it 'tallies the votes' do
    4.times { subject.vote }
    subject.votes_count.must_equal 4
  end

end