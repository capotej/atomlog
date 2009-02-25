module AtomLog

  class Parser

    def initialize(log)
      @log = log
    end

    def read
      if File.exists?(@log)
        File.open(@log).read
      else
        nil
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
      res[:name] = line[11].gsub(':','')
      res[:msg] = line[12]
      res
    end




  end


end
