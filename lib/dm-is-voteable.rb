require 'dm-is-voteable/is/voteable'
require 'dm-is-voteable/is/models/vote'

DataMapper::Model.append_extensions DataMapper::Is::Voteable
# RAILS_DEFAULT_LOGGER.info "** vote_on: initialized properly."