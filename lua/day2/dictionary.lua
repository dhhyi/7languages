print "------------------"

dictionary = {
    key1 = "value1",
    key2 = 2,
}

function dictionary:print()
    for k, v in pairs(self) do
        print(k, v)
    end
end

dictionary:print()

print "-- changed"

dictionary.key1 = nil
dictionary.key2 = "value2"
dictionary.key3 = "value3"

dictionary:print()
