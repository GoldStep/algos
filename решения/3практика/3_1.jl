function is_prime(n::IntType) where IntType <: Integer
    if n < 2
        return false
    end
    
    for i in 2:IntType(ceil(n/2))
        if n % i == 0
            return false
        end
    end
    
    return true
end

is_prime(125) #false