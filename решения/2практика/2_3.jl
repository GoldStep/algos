function logarithm(a::Float64, x::Float64, eps::Float64)
    y = 0.0
    z = x
    t = 1.0

    while abs(t) >= eps || (z > 1.0/a) || (z < a)
        if z >= a
            z /= a
            y += t
        elseif z <= 1.0/a
            z *= a
            y -= t
        else
            z *= z
            t /= 2.0
        end
    end
    
    return y
end

logarithm(2.0, 8.0, 0.1) #3.0