puts '-----------------'

class RubyCsv
  include Enumerable

  class CsvRow
    attr :parent, :index

    def initialize(parent, index)
      @parent = parent
      @index = index
    end

    def method_missing(name)
      @parent.csv_contents[index][@parent.headers.index(name.to_s)]
    end
  end

  attr_reader :headers, :csv_contents

  def initialize
    @csv_contents = []
    read
  end

  def read
    file = File.new('csv.txt')
    @headers = file.gets.chomp.split(',')
    file.each do |row|
      @csv_contents << row.chomp.split(',')
    end
  end

  def each(&block)
    @csv_contents.each_with_index do |_row, index|
      block.call(CsvRow.new(self, index))
    end
  end
end

m = RubyCsv.new
m.each do |row|
  puts "#{row.name} is #{row.age} years old."
end
