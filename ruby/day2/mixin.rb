puts '-----------------'

module ToFile
  def to_file(filename)
    puts "Saving to #{filename}"
    File.write(filename, to_s)
  end
end

class Person
  include ToFile

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{@name}"
  end
end

Person.new('matz').to_file('matz.txt~')
