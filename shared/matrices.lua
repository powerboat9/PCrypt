local mMeta = {
    __mul = function(m1, m2)
        if m1.columns ~= m2.rows then
            return false
        end
        local newMatrix = makeMatrix(m1.rows, m2.columns)
        for m1Row = 1, m1.rows do
            for m2Column = 1, m2.columns do
                for 
}

function makeMatrix(rows, columns)
    local newMatrix = {
        rows = rows,
        columns = columns,
        data = {}
    }
    for row = 1, rows do
        data[row] = {}
        for column = 1, columns do
            data[row][column] = 0
        end
    end
    setmetatable(newMatrix, mMeta)
    return newMatrix
end
