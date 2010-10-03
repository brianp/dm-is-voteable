module Brianp
  module Acts #:nodoc:
    module Voteable #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def can_be_voted_for
          has_many :votes, :as => :voteable, :dependent => :nullify
          
          include Brianp::Acts::Voteable::InstanceMethods
          extend Brianp::Acts::Voteable::SingletonMethods
        end
      end

      module SingletonMethods
        # Add class methods here
      end

      module InstanceMethods
        # Add instance methods here
      end
    end
  end
end