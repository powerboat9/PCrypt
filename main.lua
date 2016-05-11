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
    local tNums = {0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210, 231, 253, 276, 300, 325, 351, 378, 406}

local function round3()
    local newState = {}
    for i = 1, 5 do
        newState[i] = {}
        for j = 1, 5 do
            newState[j][(2 * i + 3 * j - 1) % 4 + 1] = state[i][j]
        end
    end
end
