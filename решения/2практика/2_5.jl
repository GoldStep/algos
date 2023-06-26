using SpecialFunctions

function bisection(f, a, b, eps)
    if f(a) * f(b) > 0
        return nothing
    end
    
    while (b - a) > eps
        c = (a + b) / 2
        if f(c) == 0
            return c
        elseif f(a) * f(c) < 0
            b = c
        else
            a = c
        end
    end
    
    return (a + b) / 2
end

function f(x)
    return cos(x) - x
end

bisection(f, 0, 1, 0.01)