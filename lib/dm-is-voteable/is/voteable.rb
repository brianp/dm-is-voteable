module DataMapper
  module Is #:nodoc:
    module Voteable #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def is_voteable
          has_many :votes, :as => :voteable, :dependent => :nullify
          
          include DataMapper::Is::Voteable::InstanceMethods
          extend DataMapper::Is::Voteable::SingletonMethods
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