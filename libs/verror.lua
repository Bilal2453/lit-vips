-- handle the libvips error buffer

local ffi = require "ffi"

local vips_lib
if ffi.os == "Windows" then
    local bin = './' .. ffi.os .. "-" .. ffi.arch .. '/'
    vips_lib = module:action(bin .. "libvips-42.dll", ffi.load)
else
    vips_lib = ffi.load("vips")
end

local verror = {
    -- get and clear the error buffer
    get = function()
        local errstr = ffi.string(vips_lib.vips_error_buffer())
        vips_lib.vips_error_clear()

        return errstr
    end
}

return verror
