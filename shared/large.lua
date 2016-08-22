local LARGE_FLAG = {}

local function isLarge(v)
    if type(v) == "table" and v.LARGE then
        return true
    end
    return false
end

local largeMeta = {
    __add = function(p1, p2)
        if not isLarge(p1) then
            p1 = getLarge(p1) or error("Cannot convert p1 to large", 2)
        end
        if not isLarge(p2) then
            p2 = getLarge(p2) or error("Cannot convert p2 to large", 2)
        end
        

function getLarge(n)
    if n == math.huge then
        return
    end
    return setmetatable({
        data = {n},
        LARGE = true
    }, largeMeta)
end
