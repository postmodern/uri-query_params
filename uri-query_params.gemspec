# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{uri-query_params}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-10-10}
  s.description = %q{Allows access to the query component of the URI as a Hash.}
  s.email = %q{postmodern.mod3@gmail.com}
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".gitignore",
    ".rspec",
    ".specopts",
    ".yardopts",
    "ChangeLog.md",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/uri/query_params.rb",
    "lib/uri/query_params/extensions.rb",
    "lib/uri/query_params/extensions/http.rb",
    "lib/uri/query_params/mixin.rb",
    "lib/uri/query_params/query_params.rb",
    "spec/extensions/http_spec.rb",
    "spec/query_params_spec.rb",
    "spec/spec_helper.rb",
    "uri-query_params.gemspec"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/postmodern/uri-query_params}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Access the query parameters of a URI, just like $_GET in PHP.}
  s.test_files = [
    "spec/extensions/http_spec.rb",
    "spec/query_params_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
  end
end

