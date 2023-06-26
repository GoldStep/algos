struct Polynom{T}
    coeffs::Vector{T}
    
    function Polynom{T}(coeffs::Vector{T}) where T
        while !isempty(coeffs) && iszero(last(coeffs))
            pop!(coeffs)
        end
        return new(coeffs)
    end
end

import Base: +, -, *, ^

function +(p::Polynom{T}, q::Polynom{T}) where T
    len_p = length(p.coeffs)
    len_q = length(q.coeffs)
    max_len = max(len_p, len_q)
    coeffs_p = [p.coeffs; zeros(T, max_len - len_p)]
    coeffs_q = [q.coeffs; zeros(T, max_len - len_q)]
    return Polynom{T}(coeffs_p + coeffs_q)
end

function -(p::Polynom{T}, q::Polynom{T}) where T
    return p + (-q)
end

function *(p::Polynom{T}, q::Polynom{T}) where T
    len_p = length(p.coeffs)
    len_q = length(q.coeffs)
    coeffs = Vector{T}(undef, len_p + len_q - 1)
    for i in 1:len_p, j in 1:len_q
        coeffs[i+j-1] += p.coeffs[i] * q.coeffs[j]
    end
    return Polynom{T}(coeffs)
end

function ^(p::Polynom{T}, n::Integer) where T
    result = Polynom{T}([one(T)])
    for i in 1:n
        result *= p
    end
    return result
end

function *(p::Polynom{T}, r::Residue{M}) where {T,M}
    coeffs = [coeff * r.a for coeff in p.coeffs]
    return Polynom{T}(coeffs)
end

function *(r::Residue{M}, p::Polynom{T}) where {T,M}
    return p * r
end

function display(p::Polynom{T}) where T
    len = length(p.coeffs)
    terms = []
    for (i, coeff) in enumerate(p.coeffs)
        if !iszero(coeff)
            if i == 1
                push!(terms, "$coeff")
            elseif i == 2
                push!(terms, "$coeff * x")
            else
                push!(terms, "$coeff * x^$i")
            end
        end
    end
    if isempty(terms)
        println("0")
    else
        println(join(reverse(terms), " + "))
    end
end

M = (2, 3)
p_coeffs = [1, 0, 2]
r_value = Residue{M}(1)

p = Polynom{Int64}(p_coeffs)
