using Plots

function bessel_j(n::Integer, x::Real)
    if n < 0
        return nothing
    end

    result = 0.0
    term = 1.0
    factorial_term = 1.0

    for k in 0:n
        result += term
        term *= (x / 2) / (k + 1)
        term *= (x / 2) / (n + k + 1)
        factorial_term *= (n + k + 1)
        factorial_term /= (k + 1)
    end

    result /= factorial_term
    return result
end

for x in 0.0:10.0
    y1 = bessel_j(1, x)
    y2 = bessel_j(2, x)
    y3 = bessel_j(3, x)

    plot(x, y0, label = "J₀(x)")
    plot!(x, y1, label = "J₁(x)")
    plot!(x, y2, label = "J₂(x)")
    plot!(x, y3, label = "J₃(x)")
end

xlabel!("x")
ylabel!("Jₙ(x)")
title!("Bessel Functions")

display(plot)
