require 'workdays/workdays'

describe('Workdays', function()
    describe(2022, function()
        local wd = Workdays:new(2022, {
            { 1, 1, "Neujahr" },
            { 4, 15, "Karfreitag" },
            { 4, 18, "Ostermontag" },
            { 5, 1, "Tag der Arbeit" },
            { 5, 26, "Christi Himmelfahrt" },
            { 6, 6, "Pfingstmontag" },
            { 9, 20, "Internationaler Kindertag" },
            { 10, 3, "Tag der Deutschen Einheit" },
            { 10, 31, "Reformationstag" },
            { 25, 12, "1. Weihnachtstag" },
            { 26, 12, "2. Weihnachtstag" }
        })

        it('has days', function()
            assert.same(365, wd:daysInYear())
        end)

        it('January 1st is not a workday', function()
            assert.same(false, wd:isWorkDay(1, 1))
        end)

        it('has work days', function()
            assert.same(253, #wd)
        end)

        it('should stringify', function()
            assert.same("Year 2022 with 253 work days", tostring(wd))
        end)
    end)

    describe(2021, function()
        local wd = Workdays:new(2021, {
            { 1, 1, "Neujahr" },
            { 4, 2, "Karfreitag" },
            { 4, 5, "Ostermontag" },
            { 5, 1, "Tag der Arbeit" },
            { 5, 13, "Christi Himmelfahrt" },
            { 5, 24, "Pfingstmontag" },
            { 9, 20, "Internationaler Kindertag" },
            { 10, 3, "Tag der Deutschen Einheit" },
            { 10, 31, "Reformationstag" },
            { 12, 25, "1. Weihnachtstag" },
            { 12, 26, "2. Weihnachtstag" }
        })

        it('has days', function()
            assert.same(365, wd:daysInYear())
        end)

        it('January 1st is not a workday', function()
            assert.same(false, wd:isWorkDay(1, 1))
        end)

        it('has work days', function()
            assert.same(255, #wd)
        end)

        it('should stringify', function()
            assert.same("Year 2021 with 255 work days", tostring(wd))
        end)
    end)

    describe(2020, function()
        local wd = Workdays:new(2020, {
            { 1, 1, "Neujahr" },
            { 4, 10, "Karfreitag" },
            { 4, 13, "Ostermontag" },
            { 5, 1, "Tag der Arbeit" },
            { 5, 21, "Christi Himmelfahrt" },
            { 6, 1, "Pfingstmontag" },
            { 9, 20, "Internationaler Kindertag" },
            { 10, 3, "Tag der Deutschen Einheit" },
            { 10, 31, "Reformationstag" },
            { 25, 12, "1. Weihnachtstag" },
            { 26, 12, "2. Weihnachtstag" }
        })

        it('has days', function()
            assert.same(366, wd:daysInYear())
        end)

        it('January 1st is not a workday', function()
            assert.same(false, wd:isWorkDay(1, 1))
        end)

        it('has work days', function()
            assert.same(256, #wd)
        end)

        it('should stringify', function()
            assert.same("Year 2020 with 256 work days", tostring(wd))
        end)
    end)
end)
