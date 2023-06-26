function newton(f, df, x0, eps)
    x = x0
    while abs(f(x)) > eps
        x -= f(x) / df(x)
    end
    return x
end

function f(x)
    return cos(x) - x
end

function df(x)
    return -sin(x) - 1
end

newton(f, df, 0.5, 0.01) #0.7391416661498792