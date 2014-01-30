# -*- encoding: utf-8 -*-
# stub: minitest-capybara 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-capybara"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Wojciech Mach"]
  s.date = "2013-10-07"
  s.description = "Capybara matchers support for minitest unit and spec"
  s.email = ["wojtek@wojtekmach.pl"]
  s.homepage = ""
  s.rubyforge_project = "minitest-capybara"
  s.rubygems_version = "2.2.1"
  s.summary = "Capybara matchers support for minitest unit and spec"

  s.installed_by_version = "2.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capybara>, ["~> 2.1.0"])
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<minitest>, ["~> 4.0"])
    else
      s.add_dependency(%q<capybara>, ["~> 2.1.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 4.0"])
    end
  else
    s.add_dependency(%q<capybara>, ["~> 2.1.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 4.0"])
  end
end