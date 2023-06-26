function backward_alg(A::Matrix, b::Vector)
    n = size(A, 1)
    x = similar(b)

    x[n] = b[n] / A[n, n]

    for i = n-1:-1:1
        sum = 0.0

        for j = i+1:n
            sum += A[i, j] * x[j]
        end

        x[i] = (b[i] - sum) / A[i, i]
    end

    return x
end

backward_alg([1.0 2.0 3.0; 4.0 3.0 2.0; 0.0 0.0 4.0], [5.0, 4.0, 6.0])
# 3-element Vector{Float64}:
#  -0.16666666666666696
#   0.3333333333333333
#   1.5