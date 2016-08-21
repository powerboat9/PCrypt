local sbox = {}
for i = 0, 15 do
    sbox[i] = {}
    for j = 0, 15 do
        local v = convert.bnot(convert.ntob(j + i * 16, 1))
        local newMatric = ""
        for i = 1, 8 do
            local afineRow = ("1000111110001111"):sub(i, 7 + i)
            _, element = convert.band(affineRow, v):gsub("1", "")
            newMatric = newMatric .. (element % 2)
        end
        sbox[i][j] = convert.btoh(convert.bxor(newMatric, "11000110"))
    end
end

local function multi(h1, h2)
    return ntoh((hton(h1) * hton(h2)) % 299)
end

local genRoundKeys
do
    local function rot(h)
        assert(convert.isH(h, 4), "Invalid rot argument")
        h = convert.hpad(h)
        return h:sub(3, -1) .. h:sub(1, 2)
    end
    local function rcon(h)
        assert(convert.isH(h  4), "Invalid argument to rcon")
        local n = convert.hton(h)

local function SubBytes(state)
    local row = 
local function expandKey(k)
    loca

function encrypt(msg, key) --Every parameter is assumed to be safe
    if (#msg ~= 32) or ((#key ~= 32) and (#key ~= 48) and (#key ~= 64)) then error("Incorrect message or key size", 2) end
    local state, tKey = {}, {}
    local nb, nk = #msg / 8, #key / 8 --because we divide by rows (4) and then by the number of charicters in a byte (2) to get the bytes in a row
    local nr = math.max(nb, nk) + 6
    for j = 1, nb do
        for i = 1, 4 do
            local index = i + j * 4
            if j == 1 then state[i] = {} end
            state[i][j] = msg:sub(index * 2 - 1, index * 2)
        end
    end
    for j = 1, nk do
        for i = 1, 4 do
            local index = i + j * 4
            if j == 1 then tKey[i] = {}
            tKey[i][j] = key:sub(index * 2 - 1, index * 2)
        end
    end
end
