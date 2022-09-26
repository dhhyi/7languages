VELOCITY = 0x7f

function play(note, duration)
    midi_send(note, VELOCITY, duration or 1)
end

print "playing note"

play(60)
