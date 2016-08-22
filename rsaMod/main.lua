math.randomseed(os.time()); math.random(); math.random(); math.random() --I *think* the first few values are the same on some platforms

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
    local e = nil
    do
        local q, r, s, t = {}, {}, {}, {}
        r[0] = e
        r[1] = totN
        s[0] = 1
        s[1] = 0
        t[0] = 0
        t[1] = 1
        local index = 2
        while true do
            q[index] = r[index - 2] / r[index - 1]
            r[index] = r[index - 2] - q[index] * r[index - 1]
            s[index] = s[index - 2] - q[index] * s[index - 1]
            t[index] = t[index - 2] - q[index] * t[index - 1]
            if r[index] == 0 then
                e = s[index - 1]
            end
        end
    end
    return e, d
end

function toHex(n)
    --n has to be a whole number, less than (16 ^ 16), and greater than or equal to 0
    assert((type(n) == "number") and ((n % 1) == 0), "N Has To Be A Whole Number")
    assert(n < (16 ^ 16), "N Has To Be Less Than " .. (16 ^ 16))
    assert(n >= 0, "N Can't Be Negative")
    local charValue = ""
    for i = 1, 16 do
        local numValue = math.floor(n / (16 ^ (16 - i)))
        n = n - (numValue * (16 ^ (i - 1)))
        charValue = charValue .. ("0123456789abcdef"):sub(numValue + 1, numValue + 1)
    end
    return charValue
end
    
function toNumber(hex)
    local n = 0
    for i = 1, 16 do
        local placeValue = 16 ^ (16 - i)
        local char = string.sub(i, i)
        n = n + (("0123456789abcdef"):find(char) - 1) * placeValue
    end
    return n
end

function push(data, key, n)
    return (data ^ key) % n
end
