require 'test/helper'

class TestGenerator < Test::Unit::TestCase

  def test_object_works
    a = AtomLog::Generator.new('test/fixtures/test.log')
    assert a
  end

  def test_line_to_xml
    a = AtomLog::Generator.new('test/fixtures/test.log')
    line = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    xml_line = a.line_to_xml(line)
    assert xml_line
  end

  def test_to_atom
    a = AtomLog::Generator.new('test/fixtures/test.log')
    assert a.to_atom
  end


end
