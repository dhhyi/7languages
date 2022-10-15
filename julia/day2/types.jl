println("----------------------")

abstract type HasName end
name(e::HasName) = e.name

struct Person <: HasName
    name::String
    age::Int16
end

struct Citizen <: HasName
    person::Person
    nationality::String
end
name(c::Citizen) = name(c.person)

john = Citizen(Person("John", 30), "British")
println(fieldnames(Citizen))
println(supertype(Citizen))

println(fieldnames(Person))
println(supertype(Person))

println(name(john))

println("----------------------")

struct Movie <: HasName
    name::String
    year::Int16
end

matrix = Movie("The Matrix", 1999)
println(fieldnames(Movie))
println(supertype(Movie))

println(name(matrix))

println("----------------------")

using InteractiveUtils
# https://docs.julialang.org/en/v1/stdlib/InteractiveUtils/
println(subtypes(HasName))
println(supertypes(Movie))
