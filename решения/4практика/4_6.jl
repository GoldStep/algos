function gauss(A::Matrix, b::Vector)
    n = size(A, 1)
    Ab = hcat(A, b)
    
    for i = 1:n
        max_index = argmax(abs.(Ab[i:n, i])) + i - 1
        Ab[[i, max_index], :] = Ab[[max_index, i], :]
        
        pivot = Ab[i, i]
        
        if pivot != 0.0
            Ab[i, :] /= pivot
            
            for j = i + 1:n
                factor = Ab[j, i]
                Ab[j, :] -= factor * Ab[i, :]
            end
        end
    end
    
    x = zeros(n)
    
    for i = n:-1:1
        x[i] = (Ab[i, end] - sum(Ab[i, 1:n] .* x)) / Ab[i, i]
    end
    
    return x
end

A = [2.0 1.0 -1.0; 4.0 2.0 1.0; -2.0 1.0 3.0]
b = [1.0, 2.0, 3.0]

x = gauss(A, b)
# 3-element Vector{Float64}:
#  -0.5
#   2.0
#  -0.0