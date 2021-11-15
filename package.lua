return {
  name = "Bilal2453/vips",
  version = "0.0.1",
  description = "Lua binding for the libvips image processing library ported for Luvit.",
  tags = { "image-processing", "images", "vips", "libvips", "image-manipulations" },
  license = "MIT",
  author = { name = "Bilal2453", email = "belal2453@gmail.com" },
  homepage = "https://github.com/bilal2453/lit-vips",
  dependencies = {},
  files = {
    "**.lua",
    "!example",
    "!test*",
    "$OS-$ARCH/*",
  }
}
