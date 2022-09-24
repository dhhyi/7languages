---@diagnostic disable: lowercase-global
print "----------------"

Account = {
    balance = 100,

    new = function(self, name)
        local o = {
            name = name,
            balance = self.balance
        }

        setmetatable(o, self)
        self.__index = self

        return o
    end,

    withdraw = function(self, amount)
        print("Withdrawing " .. amount .. " from " .. self.name)
        self.balance = self.balance - amount
    end,

    __tostring = function(self)
        return "Account '" .. self.name .. "' with balance " .. self.balance
    end
}

bank = Account.new(Account, "Bank")

print(bank)
bank.withdraw(bank, 10)
print(bank)

print "----------------"

expensive_account = Account.new(Account, "Expensive Account")
expensive_account.withdraw = function(self, amount)
    local tax = 0.1
    print("Withdrawing " .. amount .. " from " .. self.name)
    print("Withdrawing tax " .. (math.ceil(tax * 100)) .. "% for transfer from " .. self.name)
    self.balance = self.balance - amount - math.ceil(amount * tax)
end

print(expensive_account)
expensive_account.withdraw(expensive_account, 10)
print(expensive_account)
expensive_account.withdraw(expensive_account, 10)
print(expensive_account)
