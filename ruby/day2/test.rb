puts '------------------------------'

# animals = ['lion', 'elephant', 'deer']
# puts animals

# a = []
# # a[0] = 0
# # a[1] = 'test'
# # a[2] = ['hello', 'world']
# # a.push 123, 456
# # a.push('1', '2')

# # print a, "\n"

# # https://www.rubydoc.info/gems/rubocop/0.19.0/Rubocop/Cop/Style/NilComparison
# puts 'nil' if a.pop.nil?
# print a, "\n"

# numbers = {
#   eins: 'one',
#   zwei: 'two'
# }

# eins = :eins
# puts numbers[eins]

# def tell_the_truth(options = {})
#   if options[:profession] == :lawyer
#     'it could be believed that this is almost certainly not false.'
#   else
#     true
#   end
# end

# puts tell_the_truth profession: :lawyer
# puts tell_the_truth

# 3.times { puts '1 hiya there, kiddo' }
# 3.times do
#   puts '2 hiya there, kiddo'
# end

# animals = ['lions and', 'tigers and', 'bears', 'oh my']
# animals.each { |a| print a, ' ' }

# (1..7).each { |a| puts "#{a} -> #{a.even? ? 'even' : 'odd'}" }

# puts 4.class
# puts 4.class.superclass
# puts 4.class.superclass.superclass
# puts 4.class.superclass.superclass.superclass
# puts 4.class.superclass.superclass.superclass.superclass.nil?

# puts 4.class.class
# puts 4.class.class.superclass
# puts 4.class.class.superclass.superclass
# puts 4.class.class.superclass.superclass.superclass
# puts 4.class.class.superclass.superclass.superclass.superclass.nil?

# puts 'begin' <=> 'end'
# puts 'same' <=> 'same'

a = [5, 3, 4, 1]
puts a.to_s
# puts a.sort
# puts a.any? { |i| i > 2 }.to_s
# puts a.all? { |i| i > 2 }.to_s

# puts a.collect { |i| i * i }.to_s
# puts a.map { |i| i * i }.to_s
# puts a.select { |i| i > 2 }.to_s
# puts a.select { |i| i.even? }.to_s
# puts a.select(&:even?).to_s
# puts a.select(&:odd?).to_s
# puts a.find_all(&:odd?).to_s

# puts a.max
# puts a.min

# puts a.member?(3)
# puts a.member?(2)

# (1..6).each { |i| puts "#{i} is#{a.member?(i) ? '' : ' not'} a member" }

# puts a.inject(:+)
# puts a.inject(0) { |sum, i| sum + i }

# puts a.inject(:*)
# puts a.inject(1) { |product, i| product * i }

# puts a.inject(100, :*)
# puts a.inject 100, :*

puts(a.inject(0) do |sum, i|
  puts "sum: #{sum}, i: #{i}, sum + i: #{sum + i}"
  sum + i
end)
