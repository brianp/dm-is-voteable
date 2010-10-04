class Vote

  include DataMapper::Resource

  property :id, Serial

  property :voter, IPAddress, :unique => true# , :required => true
  property :voteable_id, Integer, :required => true
  
  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date
  
  # has 1, :voteable, :voteable_id

  # Uncomment this to limit users to a single vote on each item. 
  validates_uniqueness_of :voter

end