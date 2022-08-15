"----------------" println

a := list(list(1,2,3), list(4,5,6), list(1,1,1))

s := 0
a foreach(line, s = s + line sum)
writeln("loop: ", s)

List sumsum := method(
    s := 0
    self foreach(line, s = s + line sum)
)
writeln("sumsum: ", a sumsum)
