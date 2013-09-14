# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'voteable/version'

Gem::Specification.new do |s|
  s.name        = 'dm-is-voteable'
  s.version     = Voteable::VERSION
  s.authors     = ['brianp']
  s.email       = ['brian.o.pearce@gmail.com']
  s.summary     = %q{A DataMapper voting gem}
  s.description = %q{Simply gives a class vote tracking per model}

  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.require_paths = ['lib']

  s.add_dependency 'dm-core',        '~> 1.2.0'
  s.add_dependency 'dm-timestamps',  '~> 1.2.0'
  s.add_dependency 'dm-validations', '~> 1.2.0'
end
