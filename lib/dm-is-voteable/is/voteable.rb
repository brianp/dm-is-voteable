module DataMapper
  module Is #:nodoc:
    module Voteable #:nodoc:

      def is_voteable(options = {}, &block)
        has n, :votes, :as => :voteable, :child_key => [ :voteable_id ]
        
        if !options[:every_x_days].nil?
          Vote.instance_eval { @@x_days = 0; def x_days; @@x_days; end; def x_days=(value); @@x_days = (value); end }
          Vote.x_days = options[:every_x_days]
        end
        
        include DataMapper::Is::Voteable::InstanceMethods
        extend DataMapper::Is::Voteable::SingletonMethods
      end

      module SingletonMethods
        # Add class methods here
      end

      module InstanceMethods
        def vote(voter)
          vote = Vote.new(:voteable_id => self.id, :voteable_type => self.class, :voter => voter)
          vote.save
        end
        
        # def tally_votes(options = {})
        #   self.votes.count
        # end
        
        def tally_votes(options = {})
          count = Vote.count(:voteable_id => self.id)
        end
      end
      
    end
  end
end