require 'rubygems'
require 'builder'

module AtomLog

  class Parser

    def initialize(log)
      @log = log
    end

    def read
      if File.exists?(@log)
        File.open(@log)
      else
        false
      end
    end

    def self.parse_log_line(l)
      res = {}
      line = l.split
      hour,minute,second = line[4].split(':')
      
      res[:severity_id] = line[0].gsub(',','')
      res[:weekday] = line[1].gsub('[','')
      res[:month] = line[2]
      res[:day] = line[3]
      res[:hour] = hour
      res[:minute] = minute
      res[:second] = second
      res[:tz] = line[5]
      res[:year] = line[6]
      res[:msec] = line[7]
      res[:pid] = line[8].gsub('#','').gsub(']','')
      res[:severity] = line[9]
      res[:msg] = line[12]
      res
    end

    def parse
      arr = []
      self.read.each_line do |line|
        arr << AtomLog::Parser.parse_log_line(line)
      end
      arr
    end

  end


end
