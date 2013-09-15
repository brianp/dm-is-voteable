class Voteable::Vote
  include DataMapper::Resource

  property :id, Serial

  property :voteable_id,   Integer, required: true
  property :voteable_type, String,  required: true
  property :identifier,    String

  property :created_at, DateTime, lazy: true
  property :created_on, Date,     lazy: true
  property :updated_at, DateTime, lazy: true
  property :updated_on, Date,     lazy: true

  validates_with_method :last_vote_time

  def voteable
    voteable_class.get(voteable_id)
  end

  private

  def timed_voting?
    voteable_class.respond_to?(:last_vote_time) && !identifier.nil?
  end

  def voteable_class
    constantize(voteable_type)
  end

  def constantize(camel_cased_word)
    names = camel_cased_word.split('::')
    names.shift if names.empty? || names.first.empty?

    constant = Object
    names.each do |name|
      constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
    end
    constant
  end

  def last_vote_time
    if timed_voting?
      time = voteable_class.last_vote_time.call
      result = self.class.all(identifier: identifier, :created_on.gt => time).count == 0
      result ? true : [result, 'You have already voted']
    else
      true
    end
  end

end
