function hton(h)
    return tonumber(h, 16)
end

function bton(b)
    return tonumber(b, 2)
end

function ntoh(n)
    return ("%x"):format(n)
end

function btoh(b)
    --return ntoh(bton(b))
    return ("%x"):format(tonumber(b, 2))
end

function htob(h)
    return ntob(hton(h))
end

function ntob(n)
    local size = math.floor(math.log(n, 2))
    local bits = ""
    for i = size, 0 do
        local power = 2 ^ i
        if n >= power then
            bits = "1" .. bits
            n = n - power
        else
            bits = "0" .. bits
        end
    end
    return bits
end

function not(h)
    local b = htob(h)
    b = b:gsub("1", "2") -- 'cause I can
    b = b:gsub("0", "1")
    b = b:gsub("2", "0")
    return btoh(b)
end

local function hOperation(funct)
    return function(h1, h2)
        b1, b2 = htob(h1), htob(h2)
        local b3
        for i = 1, math.min(#b1, #b2) do
            local bool1, bool2 = b1:sub(i, i) == "1", b2:sub(i, i) == "1"
            b3 = b3 .. ((funct(bool1, bool2) and "1") or "0")
        end
        if #b1 > #b2 then
            b3 = 
        h3 = btoh(b3)
        return b3
    end
end

hand = hOperation(function(bool1, bool2) return bool1 and bool2 end)
hor = hOperation(function(bool1, bool2) return bool1 or bool2 end)
hxor = hOperation(function(bool1, bool2) return (bool2 and (not bool1)) or bool1 end) -- I'm 1, and I'm flipping you (1) off :)
