math.randomseed(os.time())

function testForPrime(n)
    --Implements Miller-Rabin, taken from in https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test
    assert(n > 0, "No Negative Numbers")
    if (n <= 3) then
        return true
    end
    if ((n % 2) == 0) or ((n % 3) == 0) then
        return false
    end
    local s, d = 0, n
    while true do
        local newD = d / 2
        if (newD % 1) == 0 then
            d = newD
            s = s + 1
        else
            break
        end
    end
    for i = 1, 16 do
        local a = math.random(1000, 2000)
        if ((a ^ d) % n) == 1 then
            return false
        end
        local rMax = s - 1
        if rMax >= 0 then
            for r = 0, rMax do
                if ((a ^ (2 ^ r * d)) % n) == -1 then
                    return false
                end
            end
        end
    end
    return true
end

function randomPrime(min, max)
    while true do
        local test = math.random(min, max)
        if testForPrime(test) then
            return test
        end
    end
end

function rsaKeygen()
    local p, q = randomPrime(1024, 4096), randomPrime(1024, 4096)
    local n = p * q
    local totN = n - (p + q - 1)
    local d = randomPrime(2, totN - 1)
    
    
