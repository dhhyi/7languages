puts '-----------------'

class Integer
  def centimeter
    self
  end

  def inch
    self * 2.54
  end

  def foot
    self * 12.inch
  end

  def yard
    self * 3.foot
  end
end

class Float
  def centimeter
    self
  end

  def inch
    self * 2.54
  end

  def foot
    self * 12.inch
  end

  def yard
    self * 3.foot
  end
end

puts 1.centimeter
puts 1.foot.centimeter
