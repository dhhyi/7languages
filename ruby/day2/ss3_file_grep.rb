puts '-----------------------------------------'

File.open('day2/loremipsum.txt', 'r') do |f|
  f.readlines.each_with_index do |line, index|
    puts "found match in line #{index + 1}" if line.include? 'eros'
  end
end
