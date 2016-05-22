local function multi(h1, h2)
    return ntoh((hton(h1) * hton(h2)) % 299)
end

local function expandKey(k)
    loca

function encrypt(msg, key) --Every parameter is assumed to be safe
    local state = {}
    local nb, nk = #msg / 8, #key / 8 --because we divide by rows (4) and then by the number of charicters in a byte (2) to get the bytes in a row
    for j = 1, nb do
        for i = 1, 4 do
            if i == j then state[i] = {} end
            state[i][j] = msg:sub(index * 2 - 1, index * 2)
        end
    end
    local key = {}
    for i = 1, 4 do
        key[i] = {}
        for j = 1, nk do
            key[i][j] = key:sub(index * 2 - 1, index * 2)
        end
    end
end
