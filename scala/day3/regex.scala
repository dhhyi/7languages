val regex = """(F|f)\w*""".r

println(regex.findAllIn("Foo Foo").toList)
println(regex.findAllIn("No Bar").toList)
