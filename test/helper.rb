require 'lib/parser'
require 'lib/generator'
require 'test/unit'

TEST_PARSER = AtomLog::Parser.new('test/fixtures/test.log')
FAIL_PARSER = AtomLog::Parser.new('this/does/not/exist')
TEST_LOG_LINE = 'I, [Wed Mar 03 02:34:24 JST 1999 895701 #19074]  INFO -- Main: info.'
ANOTHER_LOG_LINE = 'I, [2009-02-23T17:26:09.959833 #627]  INFO -- : test'

