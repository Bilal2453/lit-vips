--- handle the libvips error buffer
----

local ffi = require "ffi"

local vips_lib = ffi.os == "Windows" and ffi.load("libvips-42.dll") or ffi.load("vips")

local verror = {
    -- get and clear the error buffer
    get = function()
        local errstr = ffi.string(vips_lib.vips_error_buffer())
        vips_lib.vips_error_clear()

        return errstr
    end
}

return verror
