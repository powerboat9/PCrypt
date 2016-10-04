local primes = {}

function downloadPrimes()
    if not http then
        error("Could not download list of primes, http api disabled", 0)
    end
    local h = http.get("http://www.di-mgt.com.au/primes10000.txt")
    if not h then
        error("Could not download list of primes, site blacklisted", 0)
    end
    local txt = h.readAll()
    h.close()
    return txt
end

function savePrimes()
    local f = fs.open("primes10000.txt", "w")
    f.write(downloadPrimes())
    f.close()
    h.close()
end

local function readPrimes()
    local f = fs.open("primes10000.txt", "r")
    local txt
    if not f then
        txt = downloadPrimes()
    else        
        local txt = f.readAll()
        f.close()
    end
    txt = txt:gsub("\n[0-9]*: ", "\n"):gsub(" ", "\n")
    txt = "return {\n" .. txt:gsub("\n", ",\n") .. "\n}"
    local ok, err = pcall(load(txt, "readPrimes", "t", {}))
    if not ok then
        error("Invalid prime file", 0)
    end
    primes = err
end

readPrimes()

local function randPrime()
    return primes[math.random(#primes)]
end

local function gcf(n)
    local g = 1
    local i = 1
    while true do
        if math.sqrt(n) < primes[i] then
            return g × n
        elseif ((n / primes[i]) % 1) == 0
            g = g × primes[i]
            n = n / primes[i]
            i = 0
        end
        i = i + 1
    end
end

local function multipicativeInverse(e, n)
    --de = 1 mod n
    --de - 1 = ns
    --de - 1 - ns = 0
    --de + n(-s) = 1
    local p = {0, 1}
    local q = {}
    local sum, m = n, e
    while true do
        local mm = math.floor(sum / m) --sum = mm(m) + r
        local q[#q + 1] = mm
        local r = sum - (mm * m)
        if r == 0 then
            break
        end
        sum, m = m, r
    end
    for i = 3, #q + 1 do
        p[i] = (p[i - 2] - p[i - 1] * q[i - 2]) % n
    end
    return p[#p]
end

function createKeys()
    local p, q = randPrime(), randPrime()
    local n = p * q
    local tn = (p - 1) * (q - 1)
    local e = 35
    if e >= n then
        return createKeys()
    end
    local d = multiplicativeInverse(e, tn)
    return {e, n}, {d, n}
end

local function isValidKey(k)
    if type(k) ~= "table" then
        return false
    end
    for i = 1, 2 do
        if type(k[i]) ~= "number" or k[i] == math.huge or k[i] < 0 then
            return false
        end
    end
    return true
end

local function prep(msg, n, randLen)
    n = n or math.huge
    randLen = randLen or 32
    if type(msg) ~= "string" then
        error("Could not encrypt non string", 2)
    elseif type(n) ~= "number" or n < 0 or n == math.huge then
        error("Invalid n modulus", 2)
    elseif type(randLen) ~= "number" or randLen < 0 or randLen == math.huge then
        error("Invalid random bit length", 2)
    end
    n = math.floor(math.log(n, 2))
    local kLen = #msg * 8 + randLen
    if kLen < 0 then
        error("Message too large", 2)
    end
    local sha = {}
    if not pcall(load("loadfile(\"/PCrypt/hash/sha\")()", "shaLoad", nil, sha)) then
        error("Could not load sha library", 2)
    end
    local 

function encrypt(key, msg)
    if not isValidKey(key) then
        error("Invalid key", 0)
    elseif type(msg) ~= "number" or msg == math.huge or msg < 0 then
        error("Invalid message, expected type number", 0)
    elseif msg >= key[2] then
        error("Message too large", 0)
    end
    return (msg ^ key[1]) % key[2]
end
