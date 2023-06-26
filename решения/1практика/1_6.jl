struct Polynom{T}
    coeffs::Vector{T}
    
    function Polynom{T}(coeffs::Vector{T}) where T
        while !isempty(coeffs) && iszero(last(coeffs))
            pop!(coeffs)
        end
        return new(coeffs)
    end
end

Polynom{Int64}([1, 2, 0, 3, 0, 0]) #Polynom{Int64}([1, 2, 0, 3])