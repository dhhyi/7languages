Workdays = {}

function Workdays:new(year, holidays, month)
    local o = { year = year, holidays = holidays or {}, month = month or nil }
    setmetatable(o, self)
    self.__index = self
    return o
end

function Workdays:daysInYear()
    local first = os.time({ year = self.year, month = 1, day = 1 })
    local last = os.time({ year = self.year, month = 12, day = 31 })
    return math.floor((last - first) / 86400) + 1
end

function Workdays:isHoliday(month, day)
    for _, holiday in ipairs(self.holidays) do
        if holiday[2] == day and holiday[1] == month then
            return true
        end
    end
    return false
end

function Workdays:isWorkDay(month, day)
    if self:isHoliday(month, day) then
        return false
    end
    local weekday = os.date("*t", os.time({ year = self.year, month = month, day = day })).wday
    return weekday ~= 1 and weekday ~= 7
end

function Workdays:getWeekDay(month, day)
    local wd = os.date("%w", os.time({ year = self.year, month = month, day = day }))
    if wd == "0" then
        return "Sunday"
    elseif wd == "1" then
        return "Monday"
    elseif wd == "2" then
        return "Tuesday"
    elseif wd == "3" then
        return "Wednesday"
    elseif wd == "4" then
        return "Thursday"
    elseif wd == "5" then
        return "Friday"
    else
        return "Saturday"
    end
end

function Workdays:__pairs()
    local days = self:daysInYear()
    local i = 0
    return function()
        i = i + 1
        if i <= days then
            local date = os.time({ year = self.year, month = 1, day = i })
            local month = tonumber(os.date("%m", date))
            local day = tonumber(os.date("%d", date))
            return i, { month = month, day = day }
        end
    end
end

function Workdays:__len()
    local workdays = 0
    for _, day in pairs(self) do
        if (self.month == nil or self.month == day.month) and self:isWorkDay(day.month, day.day) then
            workdays = workdays + 1
        end
    end
    return workdays
end

function Workdays:__call(month)
    if not (month >= 1 and month <= 12) then
        return nil
    end
    return Workdays:new(self.year, self.holidays, month)
end

function Workdays:__tostring()
    return string.format("Year %s with %s work days", self.year, #self)
end
