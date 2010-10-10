# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-is-voteable}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Pearce"]
  s.date = %q{2010-10-10}
  s.description = %q{Makes a model voteable}
  s.email = %q{brian.o.pearce@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "lib/dm-is-voteable.rb", "lib/dm-is-voteable/is/models/vote.rb", "lib/dm-is-voteable/is/voteable.rb"]
  s.files = ["CHANGELOG", "MIT-LICENSE", "Manifest", "README.rdoc", "Rakefile", "dm-is-voteable.gemspec", "init.rb", "lib/dm-is-voteable.rb", "lib/dm-is-voteable/is/models/vote.rb", "lib/dm-is-voteable/is/voteable.rb"]
  s.homepage = %q{http://github.com/brianp/dm-is-voteable}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Dm-is-voteable", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{dm-is-voteable}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Makes a model voteable}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
