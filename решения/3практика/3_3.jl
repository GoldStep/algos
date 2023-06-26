function factorize(n)
    factors = Dict{Int, Int}()
    
    d = 2
    while d * d <= n
        if n % d == 0
            count = 0
            while n % d == 0
                n = n ÷ d
                count += 1
            end
            factors[d] = count
        end
        d += 1
    end
    
    if n > 1
        factors[n] = 1
    end
    
    return factors
end

factorize(84)
# Dict{Int64, Int64} with 3 entries:
#   7 => 1
#   2 => 2
#   3 => 1
# ==> 84 = 2^2 * 3^1 * 7^1