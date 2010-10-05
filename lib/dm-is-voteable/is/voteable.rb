module DataMapper
  module Is #:nodoc:
    module Voteable #:nodoc:

      def is_voteable(options = {}, &block)
        has n, :votes, :as => :voteable, :child_key => [ :voteable_id ]
        
        include DataMapper::Is::Voteable::InstanceMethods
        extend DataMapper::Is::Voteable::SingletonMethods
      end

      module SingletonMethods
        # Add class methods here
      end

      module InstanceMethods
        def vote(voter)
          # puts "HERE:"
          # puts env.inspect
          vote = Vote.new(:voteable_id => self.id, :voteable_type => self.class, :voter => voter)
          vote.save
        end
        
        # def tally_votes(options = {})
        #   self.votes.count
        # end
        
        def tally_votes(options = {})
          count = Vote.count(:conditions => ["voteable_id = ?", self.id])
        end
      end
      
    end
  end
end