using LinearAlgebra

function solve_linear_system(A::Matrix, b::Vector)
    n = size(A, 1)
    luA = lu(A)
    x = luA \ b
    return x
end

n = 1000
A = randn(n, n)
b = randn(n)

cond_A = cond(A)

@time x = solve_linear_system(A, b)
# 0.021160 seconds (4 allocations: 7.645 MiB)
# 1000-element Vector{Float64}:
#   0.32639516307128635
#   0.33669148191554565
#   0.029644939030625546
#   ⋮
#   0.81588435194388
#  -1.2010249466285832
