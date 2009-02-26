require 'test/helper'

class TestParser < Test::Unit::TestCase

  def test_object_works
    assert TEST_PARSER
  end

  def test_parse_date
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    res2 = AtomLog::Parser.parse_log_line(ANOTHER_LOG_LINE)
    assert_equal "Wed Mar 03 02:34:24 JST 1999 895701", res[:date]
    assert_equal "2009-02-23T17:26:09.959833", res2[:date]
  end

  def test_parse_severity_id
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "I", res[:severity_id]
  end

  def test_parse_pid
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "19074", res[:pid]
  end

  def test_parse_severity
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    res2 = AtomLog::Parser.parse_log_line(ANOTHER_LOG_LINE)
    assert_equal "INFO", res2[:severity]
    assert_equal "INFO", res[:severity]
  end

  def atest_parse_msg
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    res2 = AtomLog::Parser.parse_log_line(ANOTHER_LOG_LINE)
    assert_equal "test", res[:msg]
    assert_equal "test.", res[:msg]

  end

  def test_parse_arr_not_empty
    res = TEST_PARSER.parse
    assert res
  end
    
end
