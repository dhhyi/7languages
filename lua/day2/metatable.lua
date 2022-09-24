print "----------------"

table = {
    key1 = "value1",
    key2 = "value2",
}

print(table)

print "-- with meta"

mt = {
    __tostring = function(t)
        local s = ""
        for k, v in pairs(t) do
            s = s .. k .. " = " .. v .. "\n"
        end
        return s
    end
}

setmetatable(table, mt)

print(table)

print "-- undefined access"

print(table.key2)
print(table.key3)
table.key3 = "value3"

print "-- with meta"

mt.__index = function(t, k)
    print "undefined read"
end

mt.__newindex = function(t, k, v)
    print "undefined write"
end

print(table.key3)
print(table.key4)
table.key4 = "value4"

print "-- print"

print(table)
