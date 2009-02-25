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
      middle = l.split('[')[1].to_s.split(']')[0].to_s.split
      pid = middle.pop
      date = middle
      res[:date] = date.join(' ')
      res[:severity_id] = line[0].gsub(',','')
      res[:pid] = pid.to_s.gsub('#','')
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
