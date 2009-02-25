require 'lib/parser'
require 'lib/generator'

puts AtomLog::Generator.new(ARGV[0]).to_atom
