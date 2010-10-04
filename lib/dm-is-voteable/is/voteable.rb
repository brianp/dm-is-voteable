module DataMapper
  module Is #:nodoc:
    module Voteable #:nodoc:

      def is_voteable(options = {}, &block)
        has_many :votes, :as => :voteable, :dependent => :nullify
        
        include DataMapper::Is::Voteable::InstanceMethods
        extend DataMapper::Is::Voteable::SingletonMethods
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