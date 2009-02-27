module AtomLog


  class Parser

    def initialize(log, lines = nil)
      @lines = lines || 10
      @log = log
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
      log = File::Tail::Logfile.open(@log, :return_if_eof => true, :backward => @lines)
      log.tail(@lines) do |line|
        arr << AtomLog::Parser.parse_log_line(line)
      end
      arr
    end

  end


end
