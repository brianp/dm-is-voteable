module Voteable
  def is_voteable(options = {}, &block)
    has n, :votes, 'Voteable::Vote', :as => :voteable, :child_key => [ :voteable_id ]

    #if !options[:every_x_days].nil?
    #  Vote.instance_eval { @@x_days = 0; def x_days; @@x_days; end; def x_days=(value); @@x_days = (value); end }
    #  Vote.x_days = options[:every_x_days]
    #end

    include Voteable::InstanceMethods
  end

  module InstanceMethods
    def vote(voter = nil)
      Vote.create(:voteable_id => self.id, :voteable_type => self.class, :voter => voter)
    end

    def votes_count
      Voteable::Vote.all(voteable_id: self.id, voteable_type: self.class).count
    end
  end
end
