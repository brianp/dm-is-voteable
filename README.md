# dm-is-voteable

A DataMapper compatible "anonymous" voting plugin. Can track votes by IP  so a user may only submit a single vote.

## Requirments
* Rails 3+
* Ruby 1.8+

## Installation
To install as a gem add the following line to your gem file.
`gem 'dm-is-voteable'`

Then:
`bundle install`

And build the required DB tables:
`rake db:auto_update`
 
## Example

Add `is :voteable` To any model and gain the power of the vote method.

```ruby
class Movie
  include DataMapper::Resource

  property :id, Serial
  
  is :voteable
  
  property :title, String, :required => true
end
```

Vote for the Model by calling `model.vote`

Allow only a single vote per user by sending the request IP with the vote:

```ruby
user_ip = request.env['REMOTE_ADDR']
model.vote(user_ip)
```
