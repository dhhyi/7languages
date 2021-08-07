#!/usr/bin/ruby

rnd = rand(10)

guessed = nil

puts 'Guess the number from 0 to 9:'
while guessed != rnd
  guessed = gets.to_i
  if guessed == rnd
    puts 'right!'
    exit
  elsif guessed < rnd
    puts 'higher:'
  elsif guessed > rnd
    puts 'lower:'
  end
end
