local function compress()

local function genNewH(h)
    assert((type(h) == "number") and (h >= 0) and (h < (2 ^ 64)), "Invalid input")
    return h + 
