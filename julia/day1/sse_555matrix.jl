M = fill(0, 5, 5, 5)

for i in 1:5
    for j in 1:5
        for k in 1:5
            M[i, j, k] = k
        end
    end
end

# M[:, :, 1] .= 1
# M[:, :, 2] .= 2
# M[:, :, 3] .= 3
# M[:, :, 4] .= 4
# M[:, :, 5] .= 5

println(M)
