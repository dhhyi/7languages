print "-----------------"

Queue = {}

function Queue:new(from)
    local o = {
        list = from or {}
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function Queue:push(value)
    table.insert(self.list, value)
end

function Queue:pop()
    return table.remove(self.list, 1)
end

function Queue:__tostring()
    local s = "["
    for i = 1, #self.list do
        s = s .. self.list[i]
        if i < #self.list then
            s = s .. ", "
        end
    end
    s = s .. "]"
    return s
end

function Queue:__len()
    return #self.list
end

local queue = Queue:new()

queue:push(1)
queue:push(2)
queue:push(3)
queue:push(4)

print(queue)
print("length", #queue)

print("pop", queue:pop())

print(queue)
print("length", #queue)


print "-----------------"

local newQueue = Queue:new()

newQueue:push(5)

print(newQueue)

print("length", #newQueue)
print("pop", newQueue:pop())
print("length", #newQueue)
print("pop", newQueue:pop())
print("pop", newQueue:pop())
print("length", #newQueue)


print "-----------------"

local newNewQueue = Queue:new({ 'a', 'b', 'c' })

newNewQueue:push(5)

print(newNewQueue)
