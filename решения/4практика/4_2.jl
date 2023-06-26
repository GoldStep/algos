function exp_calc(x)
    int_part = trunc(x)
    fract_part = x - int_part
    
    exp_int_part = fast_pow(exp(1), int_part)

    return exp_int_part * exp(fract_part)
end

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

exp_calc(2.5) #12.182493960703473