module Voteable
  def is_voteable(options = {})
    has n, :votes, 'Voteable::Vote', as: :voteable, child_key: [ :voteable_id ]

    if (!options[:time_between_votes].nil? && options[:time_between_votes].class == Proc)
      class << self
        attr_accessor :time_between_votes
      end
      self.time_between_votes = options[:time_between_votes]
    end

    include Voteable::InstanceMethods
  end

  module InstanceMethods
    def vote(voter = nil)
      Voteable::Vote.create(voteable_id: self.id, voteable_type: self.class, voter: voter)
    end

    def votes_count
      Voteable::Vote.all(voteable_id: self.id, voteable_type: self.class).count
    end
  end
end
