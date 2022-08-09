puts '-----------------'

class Person
  include Comparable

  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def <=>(other)
    age <=> other.age
  end

  def to_s
    "[#{@name}, #{@age} years old]"
  end
end

persons = [
  Person.new('Karl', 30),
  Person.new('Egon', 50),
  Person.new('Gustav', 50),
  Person.new('Kevin', 20),
  Person.new('Claude', 10)
]

puts 'sorted'
puts persons.sort

puts 'oldest'
puts persons.max

puts 'youngest'
puts persons.min

puts 'working'
puts(persons.select { |person| person.age < 45 && person.age > 20 })

# puts persons.methods.sort
puts 'mean age'
mean = persons.map(&:age).inject(:+) / persons.length
puts mean

puts 'younger than mean'
puts(persons.select { |person| person.age < mean }.sort)
