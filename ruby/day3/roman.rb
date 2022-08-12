puts '-----------------'

class Roman
  def self.method_missing(name, *_args)
    # puts "method_missing #{name} #{args}"
    roman = name.to_s
    roman.gsub!('IV', 'IIII')
    roman.gsub!('IX', 'VIIII')
    roman.gsub!('XL', 'XXXX')
    roman.gsub!('XC', 'LXXXX')
    roman.gsub!('CM', 'DCCCC')

    roman.count('I') +
      (roman.count('V') * 5) +
      (roman.count('X') * 10) +
      (roman.count('L') * 50) +
      (roman.count('C') * 100) +
      (roman.count('D') * 500) +
      (roman.count('M') * 1000)
  end
end

puts Roman.X
puts Roman.XC
puts Roman.XCIX
puts Roman.MMXXII
puts Roman.MCMLXXXV
