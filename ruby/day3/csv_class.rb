puts '-----------------'

class ActAsCsv
  def read
    File.open('csv.txt') do |file|
      @headers = file.gets.chomp.split(',')
      file.each do |row|
        @result << row.chomp.split(',')
      end
    end
  end

  attr_reader :headers

  def csv_contents
    @result
  end

  def initialize
    @result = []
    read
  end
end

class RubyCsv < ActAsCsv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
