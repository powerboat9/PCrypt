function encrypt(data, key)
    data = data or "\00":rep(128)
    if type(data) ~= "string" then
        return nil
    elseif type(key) ~= "string" or (#key ~= 128 and key ~= 192 and key ~= 256) then
        return nil
    end
    data = split(data, 128)
    data[#data] = pad(data[#data], 128)
    
