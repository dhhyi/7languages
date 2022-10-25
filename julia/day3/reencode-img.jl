include("codec.jl")

println("--------------------")
using Pkg
if !("ImageView" ∈ keys(Pkg.project().dependencies))
    Pkg.add(["ImageView"])
end

using ImageView, TestImages, Gtk.ShortNames, ImageCore


img = testimage("cameraman")
# img = testimage("lighthouse")
img = Gray.(img)

freqs = Codec.blockdct6(img)
img2 = Codec.blockidct6(freqs)

gui = imshow_gui((300, 300), (1, 2))
canvases = gui["canvas"]
imshow(canvases[1, 1], img)
imshow(canvases[1, 2], img2)
w = Gtk.showall(gui["window"])
Gtk.fullscreen(w)

sleep(10)
