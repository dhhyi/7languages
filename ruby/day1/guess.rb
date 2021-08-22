#!/usr/bin/ruby

rnd = rand(10)

guessed = nil

print 'Guess the number from 0 to 9: '
while guessed != rnd
  guessed = gets.to_i
  if guessed == rnd
    puts 'right!'
    exit
  elsif guessed < rnd
    print 'higher: '
  elsif guessed > rnd
    print 'lower: '
  end
end
