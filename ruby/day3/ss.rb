puts '-----------------'

class CsvRow
  attr :data, :headers

  def initialize(data, headers)
    @data = data
    @headers = headers
  end

  def method_missing(name)
    @data[@headers.index(name.to_s)]
  end
end

def act_as_csv
  define_method 'read' do
    file = File.new('csv.txt')
    @headers = file.gets.chomp.split(',')
    file.each do |row|
      @csv_contents << row.chomp.split(',')
    end
  end

  define_method 'headers' do
    @headers
  end

  define_method 'csv_contents' do
    @csv_contents
  end

  define_method 'initialize' do
    @csv_contents = []
    read
  end

  define_method 'each' do |&block|
    @csv_contents.each do |row|
      block.call(CsvRow.new(row, @headers))
    end
  end
end

class RubyCsv
  act_as_csv
end

m = RubyCsv.new
m.each do |row|
  puts "#{row.name} is #{row.age} years old."
end
