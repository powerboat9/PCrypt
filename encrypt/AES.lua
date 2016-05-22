local function multi(h1, h2)
    return ntoh((hton(h1) * hton(h2)) % 299)
end

local function expandKey(k)
    loca

local function unsafeEncrypt(msg, key) --Every parameter is assumed to be safe
    local state = {}
    local nb, nk = #msg / 8, #key / 8 --because we divide by rows (4) and then by the number of charicters in a byte (2) to get the bytes in a row
    for i = 1, 4 do
        state[i] = {}
        for j = 1, nb do
            local index = i + j * 4
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

function encrypt(msg, key)
    --Pad the message, hash key
end
