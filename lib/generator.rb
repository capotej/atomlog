require 'builder'
require 'uuid'

module AtomLog

  class Generator

    def initialize(file)
      @rows = AtomLog::Parser.new(file).parse
      @builder = Builder::XmlMarkup.new(:target => @xml = "")
      @builder.instruct! :xml, :version => "1.0", :encoding => "utf-8"
      @u = UUID.new
    end
    
    def generate_xml
      @builder.feed :xmlns => "http://www.w3.org/2005/Atom" do
        @builder.title "AtomLog"
        @builder.subtitle "AtomLog for a log"
        @builder.updated Time.now
        @builder.author do
          @builder.name "AtomLog"
        end
        @builder.id @u.generate
      end
    end

    def line_to_xml(line)
      @builder.entry do
        @builder.id @u.generate
        @builder.updated line[:date]
        @builder.summary line[:msg]
      end
    end

    def to_atom
      self.generate_xml
      @rows.each do |row|
        self.line_to_xml(row)
      end
      @xml
    end
    
  end



end

