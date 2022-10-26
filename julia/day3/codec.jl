module Codec

using FFTW, ImageCore

function setParameters(args...)
end

function blockdct(img)
    pixels = convert(Array{Float64}, img)

    y, x = size(pixels)

    outx = Int(x / 8)
    outy = Int(y / 8)

    bx = 1:8:outx*8
    by = 1:8:outy*8

    mask = zeros(8, 8)
    # mask[1, 1] = 1
    # mask[1:2, 1:2] = [1 1; 1 0]
    mask[1:3, 1:3] = [1 1 1; 1 1 0; 1 0 0]
    # mask[1:4, 1:4] = [1 1 1 1; 1 1 1 0; 1 1 0 0; 1 0 0 0]
    # mask[1:5, 1:5] = [1 1 1 1 1; 1 1 1 1 0; 1 1 1 0 0; 1 1 0 0 0; 1 0 0 0 0]

    freqs = zeros(outy * 8, outx * 8)

    for i = bx, j = by
        freqs[j:j+7, i:i+7] = dct(pixels[j:j+7, i:i+7]) .* mask
    end

    return freqs
end

function togray(val)
    if val < 0
        return Gray{N0f8}(0)
    elseif val > 1
        return Gray{N0f8}(1)
    else
        return Gray{N0f8}(val)
    end
end

function blockidct(freqs)
    y, x = size(freqs)

    bx = 1:8:x
    by = 1:8:y

    pixels = zeros(y, x)

    for i = bx, j = by
        pixels[j:j+7, i:i+7] = idct(freqs[j:j+7, i:i+7])
    end

    return togray.(pixels)
end

end
