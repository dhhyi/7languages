print "----------------"

array = {
    "value1",
    2,
}

function array:print()
    for k, v in pairs(self) do
        print(k, v)
    end
end

array:print()

print "-- changed"

array[1] = nil
array[2] = "value2"
array[3] = "value3"

array:print()

print "----------------"

print(array[1])
print(array[2])
print(array[3])
