class Voteable::Vote
  include DataMapper::Resource

  property :id, Serial

  property :voteable_id,   Integer, :required => true
  property :voteable_type, String,  :required => true
  property :voter,         String

  property :created_at, DateTime, :lazy => true
  property :created_on, Date,     :lazy => true
  property :updated_at, DateTime, :lazy => true
  property :updated_on, Date,     :lazy => true

  #validates_with_method :no_vote_in_x_days
  #
  def voteable
    constantize(voteable_type).get(voteable_id)
  end

  def no_vote_in_x_days
    if Vote.respond_to?('x_days')
      return Vote.count(:voter => voter, :created_on.gt => Vote.x_days.days.ago) == 0
    else
      return true
    end
  end

  private

  def constantize(camel_cased_word)
    names = camel_cased_word.split('::')
    names.shift if names.empty? || names.first.empty?

    constant = Object
    names.each do |name|
      constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
    end
    constant
  end
end
