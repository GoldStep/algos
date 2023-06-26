function newton(f, df, x0, eps)
    x = x0
    while abs(f(x)) > eps
        x -= f(x) / df(x)
    end
    return x
end

function f(x, coeffs)
    n = length(coeffs) - 1
    result = 0.0
    for i in 0:n
        result += coeffs[i+1] * x^i
    end
    return result
end

function df(x, coeffs)
    n = length(coeffs) - 1
    result = 0.0
    for i in 1:n
        result += i * coeffs[i+1] * x^(i-1)
    end
    return result
end

coeffs = [1, -3, 2]

result = newton(x -> f(x, coeffs), x -> df(x, coeffs), 1.0, 0.01) #1.0