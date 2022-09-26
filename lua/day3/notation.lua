local function note(letter, octave)
    local notes = {
        C = 0, Cs = 1, Df = 1, D = 2, Ds = 3, Ef = 3, E = 4, F = 5, Fs = 6, Gf = 6, G = 7, Gs = 8, Af = 8, A = 9, As = 10,
        Bf = 10, B = 11
    }
    local notes_per_octave = 12
    return (octave + 1) * notes_per_octave + notes[letter]
end

local tempo = 60

local function duration(value)
    local quarter = 60 / tempo
    local durations = {
        w = 4, h = 2, q = 1, ed = 0.75, e = 0.5, s = 0.25, t = 0.125
    }
    return durations[value] * quarter
end

local function parseNotes(t)
    local letter, octave, value = t:match("([A-Gs]+)(%d+)(%a+)")
    if not (letter and octave and value) then
        return nil
    end
    return {
        note = note(letter, octave),
        duration = duration(value)
    }
end

local VELOCITY = 0x7f

local function play(notes)
    for i = 1, #notes do
        local symbol = parseNotes(notes[i])
        if symbol then
            midi_send(symbol.note, VELOCITY, symbol.duration)
        else
            print('Invalid note number ' .. i)
        end
    end
end

return {
    play = play
}
