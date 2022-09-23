"-----------------" println

Object matrix := method(x, y,
  matrix := list()
  for(i, 1, x,
    line := list()
    for(j, 1, y, line append(nil))
    matrix append(line)
  )
)

matrixFromFile := method(name,
  f := File with(name)
  f openForReading
  matrix := list()
  f readLines foreach(line, matrix append(line split(" ")))
  f close
  matrix
)

List get := method(x, y,
  self at(x) at(y)
)

List set := method(x, y, val,
  self at(x) atPut(y, val)
  self
)

List transpose := method(
  new := matrix(self at(0) size, self size)
  for(x, 0, self size - 1,
    for(y, 0, self at(0) size - 1,
      new set(y, x, self get(x, y))
    )
  )
)

List toString := method(
  s := ""
  for(x, 0, self size - 1,
    for(y, 0, self at(0) size - 1,
      v := self get(x, y)
      s = "#{s} #{v}" interpolate
    )
    s = "#{s}\n" interpolate
  )
)

List toFile := method(name,
  f := File with(name)
  f remove
  f openForUpdating
  f write(self toString)
  f close
)

matrix := matrix(4,3)
count := 1
for(x, 0, matrix size - 1,
  for(y, 0, matrix at(0) size - 1,
    matrix set(x, y, count)
    count = count + 1
  )
)

// matrix get(1,1) println
// matrix set(1,1, "hello")
// matrix get(1,1) println

matrix2 := matrixFromFile("matrix")

matrix2 println
matrix2 transpose println
