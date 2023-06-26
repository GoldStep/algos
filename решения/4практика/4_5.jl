function gauss(A::Matrix, b::Vector)
    n = size(A, 1)

    for k = 1:n-1
        for i = k+1:n
            factor = A[i, k] / A[k, k]

            A[i, k:n] -= factor * A[k, k:n]
            b[i] -= factor * b[k]
        end
    end

    return A, b
end

moded_A, moded_b = gauss([2.0 1.0 -1.0; 4.0 -1.0 3.0; -2.0 5.0 2.0], [1.0, 2.0, -1.0])
# [2.0, 1.0, -1.0;
#  0.0, -3.0, 5.0;
#  0.0, 0.0, 11.0]

#  [1.0, 0.0, 0.0]