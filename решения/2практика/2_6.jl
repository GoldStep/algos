function newton(f, df, x0, eps)
    x = x0
    while abs(f(x)) > eps
        x -= f(x) / df(x)
    end
    return x
end

f(x) = x^2
df(x) = 2x

newton(f, df, 1.5, 0.01) #0.09375