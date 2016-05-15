function genPair(
    local p = RSA.genPrime()
    local g
    while true do
        g = math.random(1, 64)
        local done, allredy = true, {}
        for i = 1, p - 1 do
            local v = (g ^ (i - 1)) % p
            if allredy[v] then
                done = false
                break
            else
                allredy[v] = true
            end
        end
    end
    return p, g
end

function getSecrets(a, sentB)
