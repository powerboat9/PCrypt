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

local function round3()
    local newState = {}
    for i = 1, 5 do
        newState[i] = {}
        for j = 1, 5 do
            newState[j][(2 * i + 3 * j - 1) % 4 + 1] = state[i][j]
        end
    end
end
