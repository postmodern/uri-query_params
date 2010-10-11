require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'uri-query_params'
    gem.license = 'MIT'
    gem.summary = %Q{Access the query parameters of a URI, just like $_GET in PHP.}
    gem.description = %Q{Allows access to the query component of the URI as a Hash.}
    gem.email = 'postmodern.mod3@gmail.com'
    gem.homepage = 'http://github.com/postmodern/uri-query_params'
    gem.authors = ['Postmodern']
    gem.add_development_dependency 'rspec', '~> 2.0.0'
    gem.add_development_dependency 'yard', '>= 0.5.3'
    gem.has_rdoc = 'yard'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new
  task :default => :spec
rescue LoadError
  task :spec do
    abort "RSpec 2.0.0 is not available. In order to run spec, you must: gem install rspec"
  end
end

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yard do
    abort "YARD is not available. In order to run yard, you must: gem install yard"
  end
end
