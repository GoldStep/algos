function fast_pow(a, n)

    if n == 0
        return one(a)
    elseif n < 0
        a = inv(a)
        n = -n
    end

    result = one(a)
    while n > 0
        if isodd(n)
            result *= a
        end
        a *= a
        n = div(n, 2)
    end

    return result
end

fast_pow(1345, 52345) #339371329522842433