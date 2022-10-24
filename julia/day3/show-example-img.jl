using Pkg
Pkg.add(["ImageView"])

using ImageView, TestImages, Gtk.ShortNames

gui = imshow_gui((300, 300), (1, 2))
canvases = gui["canvas"]
imshow(canvases[1, 1], testimage("lighthouse"))
imshow(canvases[1, 2], testimage("cameraman"))
Gtk.showall(gui["window"])

sleep(10)
