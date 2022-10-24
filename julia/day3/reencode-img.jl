include("codec.jl")

using Pkg
Pkg.add(["ImageView"])

using ImageView, TestImages, Gtk.ShortNames, ImageCore


# img = testimage("cameraman")
img = testimage("lighthouse")
img = Gray.(img)

freqs = Codec.blockdct6(img)
img2 = Codec.blockidct6(freqs)

gui = imshow_gui((300, 300), (1, 2))
canvases = gui["canvas"]
imshow(canvases[1, 1], img)
imshow(canvases[1, 2], img2)
Gtk.showall(gui["window"])

sleep(10)
