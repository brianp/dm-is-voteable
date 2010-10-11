class Vote

  include DataMapper::Resource

  property :id, Serial

  property :voter, IPAddress
  property :voteable_id, Integer, :required => true
  property :voteable_type, String, :required => true
  
  property :created_at, DateTime, :lazy => true
  property :created_on, Date, :lazy => true
  property :updated_at, DateTime, :lazy => true
  property :updated_on, Date, :lazy => true
  
  validates_with_method :no_vote_in_x_days
  
  def no_vote_in_x_days
    if Vote.respond_to?('x_days')
      return Vote.count(:voter => voter, :created_on.gt => Vote.x_days.days.ago) == 0
    else
      return true
    end
  end
    
  # belongs_to :voteable, :voteable_id

end
