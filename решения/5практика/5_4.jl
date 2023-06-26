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

function shell!(arr)
    n = length(arr)
    gap = div(n, 2)

    while gap > 0
        for i = gap+1:n
            j = i
            while j > gap && arr[j-gap] > arr[j]
                arr[j-gap], arr[j] = arr[j], arr[j-gap]
                j -= gap
            end
        end
        gap = div(gap, 2)
    end
end

function shell(arr)
    sorted_arr = copy(arr)
    shell!(sorted_arr)
    return sorted_arr
end


arr = rand(10^6)

@time merge_sort(arr) #1.555300 seconds
@time shell!(arr) #0.243966 seconds