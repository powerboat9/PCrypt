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

function ntob(n)
    return 
