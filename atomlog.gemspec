# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{atomlog}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["jcapote"]
  s.date = %q{2009-02-26}
  s.default_executable = %q{log2atom}
  s.description = %q{A library for parsing ruby's Logger format into an Atom feed}
  s.email = %q{jcapote@gmail.com}
  s.executables = ["log2atom"]
  s.files = ["README.markdown", "VERSION.yml", "bin/log2atom", "lib/generator.rb", "lib/parser.rb", "test/fixtures", "test/fixtures/test.log", "test/helper.rb", "test/test_generator.rb", "test/test_parser.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jcapote/atomlog}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A library for parsing ruby's Logger format into an Atom feed}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
