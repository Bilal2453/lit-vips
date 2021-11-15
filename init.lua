-- top include for lua-vips

local ffi = require "ffi"

local vips_lib
if ffi.os == "Windows" then
    local bin = './' .. ffi.os .. "-" .. ffi.arch .. '/'
    vips_lib = module:action(bin .. "libvips-42.dll", ffi.load)
else
    vips_lib = ffi.load("vips")
end

require "cdefs"

local result = vips_lib.vips_init("lua-vips")
if result ~= 0 then
    local errstr = ffi.string(vips_lib.vips_error_buffer())
    vips_lib.vips_error_clear()

    error("unable to start up libvips: " .. errstr)
end

local vips = {
    verror = require "verror",
    version = require "version",
    log = require "log",
    gvalue = require "gvalue",
    vobject = require "vobject",
    voperation = require "voperation",
    Image = require "Image_methods",
}

function vips.leak_set(leak)
    vips_lib.vips_leak_set(leak)
end

function vips.cache_set_max(max)
    vips_lib.vips_cache_set_max(max)
end

function vips.cache_get_max()
    return vips_lib.vips_cache_get_max()
end

function vips.cache_set_max_files(max)
    vips_lib.vips_cache_set_max_files(max)
end

function vips.cache_get_max_files()
    return vips_lib.vips_cache_get_max_files()
end

function vips.cache_set_max_mem(max)
    vips_lib.vips_cache_set_max_mem(max)
end

function vips.cache_get_max_mem()
    return vips_lib.vips_cache_get_max_mem()
end

-- for compat with 1.1-6, when these were misnamed
vips.set_max = vips.cache_set_max
vips.get_max = vips.cache_get_max
vips.set_max_files = vips.cache_set_max_files
vips.get_max_files = vips.cache_get_max_files
vips.set_max_mem = vips.cache_set_max_mem
vips.get_max_mem = vips.cache_get_max_mem

return vips
