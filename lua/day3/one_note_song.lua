VELOCITY = 0x7f

function play(note, duration)
    midi_send(1, note, VELOCITY, duration or 1)
end

print "playing note"

play(60, 4)
