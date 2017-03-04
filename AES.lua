local function split(str, size)
    local t = {}
    local i, j = 1, #str
    for i, math.ceil(#str / size)
        t[i] = str:sub((i - 1) * size + 1, i * size)
    end
    return t
end

local function pad(str, i)
    return str .. ("\00"):rep(i - #str)
end

local function gcf(i, j)
    if j > i then
        i, j = j, i
    end
    local n
    while true do
        n = i % j
        if n == 0

local function lcm(i, j)
    local div = gcf(i, j)

function encrypt(data, key)
    data = data or "\00":rep(128)
    if type(data) ~= "string" then
        return nil
    elseif type(key) ~= "string" or (#key ~= 128 and key ~= 192 and key ~= 256) then
        return nil
    end
    data = split(data, 128)
    data[#data] = pad(data[#data], 128)
    
