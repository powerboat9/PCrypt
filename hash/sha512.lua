function hash512(msg)
    assert(type(msg) == "string", "Invalid input")
    local bin = convert.stob(msg) .. "1"
    local len = #bin
    local add = ((len % 1024) - 896) % 1024
    bin = bin 

local function genNewH(h)
    assert(convert.isHex(h, 8), "Invalid input")
    
