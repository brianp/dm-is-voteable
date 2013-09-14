# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "voteable/version"

Gem::Specification.new do |s|
  s.name        = 'dm-is-voteable'
  s.version     = Voteable::VERSION
  s.authors     = ["brian pearce"]
  s.email       = ["brian.o.pearce@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A DataMapper voting gem}
  s.description = %q{Simply gives a class vote tracking per model}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'minitest'
end
