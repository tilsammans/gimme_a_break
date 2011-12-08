# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "gimme_a_break"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joost Baaij"]
  s.date = "2011-12-08"
  s.description = "Throttle ActiveRecord creation"
  s.email = "joost@spacebabies.nl"
  s.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "lib/gimme_a_break.rb"]
  s.files = ["CHANGELOG", "MIT-LICENSE", "README.rdoc", "Rakefile", "init.rb", "lib/gimme_a_break.rb", "Manifest", "gimme_a_break.gemspec"]
  s.homepage = "http://github.com/tilsammans/gimme_a_break"
  s.post_install_message = "  \n    *****************************************************\n    gimme_a_break installed.\n\n    Make sure your models have a created_at column.\n    Adding an index to this column is highly recommended.\n    *****************************************************\n\n"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Gimme_a_break", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "gimme_a_break"
  s.rubygems_version = "1.8.10"
  s.summary = "Throttle ActiveRecord creation"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 0"])
  end
end
