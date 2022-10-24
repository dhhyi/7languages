using TestImages, FFTW

println("------------------")

img = testimage("cameraman")

pixels = img[1:8, 1:8]
pixels = convert(Array{Float64}, pixels)

println("pixels: ", pixels)

freqs = dct(pixels)
println("freqs: ", round.(freqs))

pixels2 = idct(freqs)
println("pixels: ", pixels2)
