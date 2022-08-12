puts '-----------------'

class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    empty?
  end
end

['', 'string', nil].each do |x|
  puts "#{x.class} with value '#{x}' is blank? #{x.blank?}"
end
