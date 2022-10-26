println("--------------------")

# include("codec.jl")
include("ss_codec.jl")

using Pkg
if "ImageView" ∉ keys(Pkg.project().dependencies)
    Pkg.add(["ImageView"])
end

using ImageView, TestImages, Gtk.ShortNames, ImageCore

Codec.setParameters(8, 6)

img = testimage("cameraman")
# img = testimage("lighthouse")
img = Gray.(img)

println("Image size: ", size(img))

freqs = Codec.blockdct(img)

println("Frequency size: ", size(freqs))

# add noise
# freqs = freqs .+ 0.1 .* randn(size(freqs))

img2 = Codec.blockidct(freqs)

println("Image size: ", size(img2))

gui = imshow_gui((300, 300), (1, 2))
canvases = gui["canvas"]
imshow(canvases[1, 1], img)
imshow(canvases[1, 2], img2)
w = Gtk.showall(gui["window"])
Gtk.fullscreen(w)

sleep(10)
