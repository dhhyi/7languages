module Codec

using FFTW, ImageCore

blocksize = 8
coefficients = 6

function setParameters(size, keep)
    global blocksize = size
    global coefficients = keep
end

function blockdct(img)
    mask = zeros(blocksize, blocksize)

    keep = coefficients
    for l = 1:blocksize
        for i in CartesianIndices(mask)
            if i[1] + i[2] == l
                mask[i] = 1
                keep -= 1
                if keep == 0
                    break
                end
            end
        end
        if keep == 0
            break
        end
    end

    display(Int.(mask))

    pixels = convert(Array{Float64}, img)

    y, x = size(pixels)

    outx = x ÷ blocksize
    outy = y ÷ blocksize

    bx = 1:blocksize:outx*blocksize
    by = 1:blocksize:outy*blocksize

    freqs = zeros(outy * blocksize, outx * blocksize)

    for i = bx, j = by
        freqs[j:j+(blocksize-1), i:i+(blocksize-1)] = dct(pixels[j:j+(blocksize-1), i:i+(blocksize-1)]) .* mask
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

    bx = 1:blocksize:x
    by = 1:blocksize:y

    pixels = zeros(y, x)

    for i = bx, j = by
        pixels[j:j+(blocksize-1), i:i+(blocksize-1)] = idct(freqs[j:j+(blocksize-1), i:i+(blocksize-1)])
    end

    return togray.(pixels)
end

end
