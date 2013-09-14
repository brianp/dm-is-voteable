# dm-is-voteable
[![Build
Status](https://travis-ci.org/brianp/dm-is-voteable.png?branch=master)](https://travis-ci.org/brianp/dm-is-voteable)
[![Code
Climate](https://codeclimate.com/github/brianp/dm-is-voteable.png)](https://codeclimate.com/github/brianp/dm-is-voteable)

A DataMapper compatible voting gem. Can track votes by identifier so a user may only submit a single vote.

## Requirments
* Ruby 1.9

## Installation
To install as a gem add the following line to your gem file.
`gem 'dm-is-voteable'`

Then:
`bundle install`

And build the required DB tables:
`rake db:auto_update`
 
## Example

Add `is_voteable` To any model and gain the power of the vote method.

```ruby
class Movie
  include DataMapper::Resource

  property :id, Serial
  
  is_voteable
  
  property :title, String, required: true
end
```

Vote for the Model by calling `model.vote`

## Voting Restrictions

Allow only a single vote per user within a certain time frame by setting a time frame in the model:

```ruby
class Movie
  include DataMapper::Resource

  property :id, Serial
  
  is_voteable(time_between_votes: ->{ 3.days.ago })
  
  property :title, String, required: true
end
```

Then send an identifier along with the vote:

```ruby
user_ip = request.env['REMOTE_ADDR']
model.vote(user_ip)
```
