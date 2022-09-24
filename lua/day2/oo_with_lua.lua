---@diagnostic disable: lowercase-global
print "----------------"

Account = { balance = 100 }

function Account:new(name)
    local o = {
        name = name,
        balance = self.balance
    }

    setmetatable(o, self)
    self.__index = self

    return o
end

function Account:withdraw(amount)
    print("Withdrawing " .. amount .. " from " .. self.name)
    self.balance = self.balance - amount
end

function Account:__tostring()
    return "Account '" .. self.name .. "' with balance " .. self.balance
end

bank = Account:new("Bank")

print(bank)
bank:withdraw(10)
print(bank)

print "----------------"

ExpensiveAccount = Account:new()
function ExpensiveAccount:withdraw(amount)
    local tax = 0.2
    print("Withdrawing " .. amount .. " from " .. self.name)
    print("Withdrawing tax " .. (math.ceil(tax * 100)) .. "% for transfer from " .. self.name)
    self.balance = self.balance - amount - math.ceil(amount * tax)
end

function ExpensiveAccount:__tostring()
    return Account.__tostring(self)
end

expensive_account = ExpensiveAccount:new("Expensive Account")
print(expensive_account)
expensive_account:withdraw(10)
print(expensive_account)
expensive_account:withdraw(10)
print(expensive_account)
