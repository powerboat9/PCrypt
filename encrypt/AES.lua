local function expandKey(k)
    loca

local function unsafeEncrypt(msg, key) --Every parameter is assumed to be safe
    local state = {}
    for i = 1, 4 do
        state[i] = {}
        for j = 1, 4 do
            local index = i + j * 4
            state[i][j] = msg:sub(index * 2 - 1, index * 2)
        end
    end
end
