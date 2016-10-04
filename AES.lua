local function isHex(str, len)
    if type(str) ~= "string" or str:gsub("[^0-9a-fA-F]", "") ~= str or (len and (#str / 2) ~= len) then
        return false
    end
    return true
end

local function xorHex(p1, p2)
    if not isHex(p1) or not isHex(p2, #p1 / 2) then
        return nil
    end
    if #p1 == 
    local len, ret = #p1, ""
    local r1, r2 = math.min
    while true do
        local n1, n2 = tonumber(p1, 16), tonumber(p2, 16)
        ret = ret ..