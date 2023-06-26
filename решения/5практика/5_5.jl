function quick_sort(arr)
    if length(arr) ≤ 1
        return arr
    end

    pivot = arr[rand(1:length(arr))]  # Случайный выбор опорного элемента
    less = [x for x in arr if x < pivot]
    equal = [x for x in arr if x == pivot]
    greater = [x for x in arr if x > pivot]

    return vcat(quick_sort(less), equal, quick_sort(greater))
end

function merge_sort(arr)
    n = length(arr)
    if n <= 1
        return arr
    end
    mid = div(n, 2)
    left = merge_sort(arr[1:mid])
    right = merge_sort(arr[mid+1:end])
    merge(left, right)
end

function merge(left, right)
    merged = []
    i, j = 1, 1
    while i <= length(left) && j <= length(right)
        if left[i] <= right[j]
            push!(merged, left[i])
            i += 1
        else
            push!(merged, right[j])
            j += 1
        end
    end
    while i <= length(left)
        push!(merged, left[i])
        i += 1
    end
    while j <= length(right)
        push!(merged, right[j])
        j += 1
    end
    return merged
end

arr = rand(10^6)

@time quick_sort(arr) #  1.060622 seconds
@time merge_sort(arr) # 1.532947 seconds
