module Voteable
  def is_voteable(options = {})
    has n, :votes, 'Voteable::Vote', as: :voteable, child_key: [ :voteable_id ]

    if (!options[:last_vote_time].nil? && options[:last_vote_time].class == Proc)
      class << self
        attr_accessor :last_vote_time
      end
      self.last_vote_time = options[:last_vote_time]
    end

    include Voteable::InstanceMethods
  end

  module InstanceMethods
    def vote(identifier = nil)
      Voteable::Vote.create(voteable_id: self.id, voteable_type: self.class, identifier: identifier)
    end

    def votes_count
      Voteable::Vote.all(voteable_id: self.id, voteable_type: self.class).count
    end
  end
end
