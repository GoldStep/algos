function fast_pow(a, exp)

    if exp == 0
        return one(a)
    elseif exp < 0
        a = inv(a)
        exp = -exp
    end

    result = one(a)
    while exp > 0
        if isodd(exp)
            result *= a
        end
        a *= a
        exp = div(exp, 2)
    end

    return result
end

function fibonacci(n)
    matrix = [1 1; 1 0]
    fast_pow(matrix, n-1)[1, 1]
end

fibonacci(10) #55