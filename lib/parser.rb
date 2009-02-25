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
      line = l.split('[')[1].to_s.split(']')
      middle = line[0].to_s.split
      pid = middle.pop
      date = middle
      severity,msg = line[1].to_s.split('--')
      res[:date] = date.join(' ')
      res[:severity_id] = l.split[0].to_s.gsub(',','')
      res[:pid] = pid.to_s.gsub('#','')
      res[:severity] = severity.to_s.gsub(' ','')
      res[:msg] = msg
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
