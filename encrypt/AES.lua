local function multi(h1, h2)
    return ntoh((hton(h1) * hton(h2)) % 299)
end

local function SubBytes(b)

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
