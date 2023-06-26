function std(arr)
    n = length(arr)
    if n == 0
        return nothing
    end
    
    mean = 0.0
    sum = 0.0
    
    for x in arr
        mean += x
        sum += x^2
    end
    
    mean /= n
    variance = (sum / n) - (mean^2)
    answ = sqrt(variance)
    
    return answ
end

std([1, 2, 3, 4, 5]) #1.4142135623730951