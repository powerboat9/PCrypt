local primes = {}

local function readPrimes()
    local f = fs.open("primes10000.txt", "r")
    local txt = f.readAll()
    f.close()
    txt = txt:gsub("\n[0-9]*: ", "\n"):gsub(" ", "\n")
    txt = "return {\n" .. txt:gsub("\n", ",\n") .. "\n}"
    local ok, err = pcall(function() load(txt, "readPrimes", "t", {}) end)
    if not ok then
        error("Invalid prime file", 0)
    end
    primes = err
end

readPrimes()

local function randPrime()
    return primes[math.random(#primes)]
rnd

function createKeys()
    local p, q = randPrime(), randPrime()
    local n = p * q
    local tn = (p - 1) * (q - 1)
    local e = 35
    if e >= n then
        return createKeys()
    end
    
