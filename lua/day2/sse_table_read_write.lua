print "--------------"

local function guardedTable(t)
    local l = t
    local mt = {
        __tostring = function(t)
            local s = ""
            for k, v in pairs(l) do
                s = s .. k .. " = " .. v .. "\n"
            end
            return s
        end,

        __index = function(_, k)
            local v = rawget(l, k)
            if v == nil then
                print("Key " .. k .. " not found")
            end
            return v
        end,

        __newindex = function(_, k, v)
            local old = rawget(l, k)
            if old == nil then
                print("New key " .. k)
            elseif v == nil then
                print("Deleting key " .. k)
            else
                print("Changing key " .. k)
            end
            rawset(l, k, v)
        end
    }
    local o = {}
    setmetatable(o, mt)
    return o
end

local table = guardedTable {
    k1 = "v1",
    k2 = "v2",
}

print(table)

print(table.k1)
print(table.k3)
table.k2 = "n2"
table.k3 = "v3"
table.k1 = nil

print(table)
