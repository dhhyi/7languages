puts '-----------------'

def define_imperial
  define_method 'centimeter' do
    self
  end

  define_method 'inch' do
    self * 2.54
  end

  define_method 'foot' do
    self * 12.inch
  end

  define_method 'yard' do
    self * 3.foot
  end

  define_method 'mile' do
    self * 5280.foot
  end
end

class Integer
  define_imperial
end

class Float
  define_imperial
end

puts 1.centimeter
puts 1.foot.centimeter
puts 1.mile.centimeter
