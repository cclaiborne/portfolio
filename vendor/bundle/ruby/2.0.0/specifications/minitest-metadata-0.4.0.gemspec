# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "minitest-metadata"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wojciech Mach"]
  s.date = "2013-04-23"
  s.description = "Metadata (key-value) support for minitest/spec"
  s.email = ["wojtek@wojtekmach.pl"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubyforge_project = "minitest-metadata"
  s.rubygems_version = "2.0.3"
  s.summary = "Metadata (key-value) support for minitest/spec"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, ["~> 4.7"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, ["~> 4.7"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 4.7"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
