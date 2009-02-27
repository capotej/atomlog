require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "atomlog"
    s.summary = "A library for parsing ruby's Logger format into an Atom feed"
    s.email = "jcapote@gmail.com"
    s.homepage = "http://github.com/jcapote/atomlog"
    s.description = "A library for parsing ruby's Logger format into an Atom feed"
    s.authors = ["jcapote"]
    s.add_dependency 'uuid'
    s.add_dependency 'builder'
    s.add_dependency 'file-tail'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'atomlog'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end


task :default => :test
