puts '----------------------------------------'

a = (1..16)

puts a.to_a.inspect

a.each do |i|
  print i
  if (i % 4).zero?
    print "\n"
  else
    print ' '
  end
end

puts

a.each_slice(4) do |i|
  # puts i.inject { |sum, x| "#{sum} #{x}" }
  puts i.join(' ')
end
