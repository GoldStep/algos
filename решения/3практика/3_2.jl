function sieve(n)
    is_prime = trues(n)
    
    is_prime[1] = false
    
    for i in 2:isqrt(n)
        if is_prime[i]
            for j in i^2:i:n
                is_prime[j] = false
            end
        end
    end
    
    primes = [i for i in 1:n if is_prime[i]]
    
    return primes
end

sieve(10)
# 4-e lement Vector{Int64}:
# 2
# 3
# 5
# 7