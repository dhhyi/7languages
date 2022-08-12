puts '-----------------'

module ActAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def act_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = 'csv.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(',')
      file.each do |row|
        @csv_contents << row.chomp.split(',')
      end
    end

    def headers
      @headers
    end

    def csv_contents
      @csv_contents
    end

    def initialize
      read
    end
  end
end

class RubyCsv
  include ActAsCsv
  act_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
