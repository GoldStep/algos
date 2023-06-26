function ryad_taylora(x, n)
    result = 1.0
    term = 1.0
    
    for i in 1:n
        term *= x / i
        result += term
    end
    
    return result
end

ryad_taylora(2.0, 10) #7.388994708994708