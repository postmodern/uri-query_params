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
    gem.has_rdoc = 'yard'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

begin
  require 'spec/rake/spectask'
  Spec::Rake::SpecTask.new(:spec) do |spec|
    spec.libs += ['lib', 'spec']
    spec.spec_files = FileList['spec/**/*_spec.rb']
    spec.spec_opts = ['--options', '.specopts']
  end

  task :spec => :check_dependencies
  task :default => :spec
rescue LoadError
  task :spec do
    abort "RSpec is not available. In order to run `rake spec`, you must: gem install rspec"
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
