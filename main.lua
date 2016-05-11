local input = ...
local l = 6

local wSize = 2 ^ l
local rounds = 12 + 2 * l

local state = {}
for i = 1, 5 do
    state[i] = {}
    for j = 1, 5 do
        state[i][j] = {}
        for k = 1, wSize do
            state[i][j][k] = (5 * i + j) * w + k
        end
    end
end

local function toByte(char)
    if #char > 1 then
        error("Invalid Charicter", 2)
    end
    local n = char:byte()
    local byte = {} --Little Edian
    for i = 8, 1 do
        local v = n >= (2 ^ (i - 1))
        if v then
            n = n - v
            byte[9 - i] = true
        else
            byte[9 - i] = false
        end
    end
    return byte
end

local inBytes = {}
for i = 1, #input do
    local byte = toByte(input:sub(i, i))
    for j = 1, 8 do
        inBytes[(i - 1) * 8 + j] = byte[j]
    end
end

local inLength = #inBytes



local function xor(v1, v2)
    return (v1 or v2) and (not (v1 and v2))
end

local function round1()
    for i = 1, 5 do
        for j = 1, 5 do
            for k = 1, wSize do
                state[i][j][k] = xor(state[i][j][k], state[i][(j - 2) % 4 + 1][k])
                state[i][j][k] = xor(state[i][j][k], state[i][j % 4 + 1][(k - 2) % wSize + 1])
            end
        end
    end
end

local function round2()
    --[[local tNums = {}
    for iTNum = 1, rounds do
        local processNum = iTNum
        while processNum > 0 do
            tNums[iTNum] = tNum[iTNum] + processNum * 3 - 2
            processNum = processNum - 3
        end
    end]]--
    
    --local tNums = {0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210, 231, 253, 276, 300}
    for i = 1, 5 do
        for j = 1, 5 do
            for k = 1, wSize do
                local t = (i - 1) * 5 + j - 1 --To get the triangle number index
                state[i][j][k] = state[i][j][k - ((t + 1) * (t + 2) / 2)]
            end
        end
    end
end

local function round3()
    for i = 1, 5 do
        for j = 1, 5 do
            state[j][(2 * i + 3 * j - 1) % 4 + 1] = state[i][j]
        end
    end
end

local function round4()
    for i = 1, 5 do
        for j = 1, 5 do
            for k = 1, wSize do
                state[i][j][k] = xor(state[i][j][k], (not state[i][(j - 2) % 4 + 1][k]) and state[i][(j - 3) % 4 + 1][k])
            end
        end
    end
    state = newState
end

local function round5(r)
    for n = 1, l do
        
