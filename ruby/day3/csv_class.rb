puts '-----------------'

class ActAsCsv
  attr_reader :headers, :csv_contents

  def read
    File.open('csv.txt') do |file|
      @headers = file.gets.chomp.split(',')
      file.each do |row|
        @csv_contents << row.chomp.split(',')
      end
    end
  end

  def initialize
    @csv_contents = []
    read
  end
end

class RubyCsv < ActAsCsv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
