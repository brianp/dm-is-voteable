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
  
  validates_with_method :no_vote_in_3_days
  
  def no_vote_in_3_days 
   Vote.count(:voter => voter, :created_on.gt => 2.days.ago) == 0
  end
  
  # belongs_to :voteable, :voteable_id
  
  # Uncomment this to limit users to a single vote. 
  # validates_uniqueness_of :voter

end
