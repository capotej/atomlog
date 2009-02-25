require 'test/helper'

class TestParser < Test::Unit::TestCase

  def test_object_works
    assert TEST_PARSER
  end

  def test_file_open
    assert TEST_PARSER.read
  end

  def test_parse_severity_id
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "I", res[:severity_id]
  end

  def test_parse_weekday
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "Wed", res[:weekday]
  end
    
  def test_parse_month
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "Mar", res[:month]
  end

  def test_parse_day
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "03", res[:day]
  end
  
  def test_parse_hour
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "02", res[:hour] 
  end
  
  def test_parse_minute
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "34", res[:minute]
  end

  def test_parse_second
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "24", res[:second]
  end

  def test_parse_tz
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "JST", res[:tz]
  end

  def test_parse_year
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "1999", res[:year]
  end

  def test_parse_msec
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "895701", res[:msec]
  end

  def test_parse_pid
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "19074", res[:pid]
  end

  def test_parse_severity
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "INFO", res[:severity]
  end

  def test_parse_name
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "Main", res[:name]
  end

  def test_parse_msg
    res = AtomLog::Parser.parse_log_line(TEST_LOG_LINE)
    assert_equal "info.", res[:msg]
  end

    
end
