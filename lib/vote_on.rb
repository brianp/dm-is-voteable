require 'can_be_voted_for'
require 'models/vote'

DataMapper::Model.append_extensions Brianp::Acts::Voteable
RAILS_DEFAULT_LOGGER.info "** vote_on: initialized properly."
