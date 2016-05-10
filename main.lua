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

