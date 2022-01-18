--- detect and test libvips version
----

local ffi = require "ffi"

local vips_lib = ffi.os == "Windows" and ffi.load("libvips-42.dll") or ffi.load("vips")

local version = {}

version = {
    major = vips_lib.vips_version(0),
    minor = vips_lib.vips_version(1),
    micro = vips_lib.vips_version(2),

    -- test for libvips version is better than x.y .. we use this to turn on
    -- various workarounds for older libvips
    at_least = function(x, y)
        return version.major > x or (version.major == x and version.minor >= y)
    end
}

return version
