---@diagnostic disable: undefined-global, lowercase-global
print "------------------"

while math.random(100) > 3 do
    lost1 = (lost1 or 0) + 1
    local lost2 = (lost2 or 0) + 1
end

print("you won after " .. (lost1 or 'invisible') .. " losses")
print("you won after " .. (lost2 or 'invisible') .. " losses")
