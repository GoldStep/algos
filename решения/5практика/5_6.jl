function quickselect(arr, k)
    if length(arr) ≤ 1
        return arr[1]
    end

    pivot_idx = partition(arr)
    if k == pivot_idx
        return arr[k]
    elseif k < pivot_idx
        return quickselect(arr[1:pivot_idx-1], k)
    else
        return quickselect(arr[pivot_idx+1:end], k - pivot_idx)
    end
end

function partition(arr)
    pivot_idx = rand(1:length(arr))
    pivot = arr[pivot_idx]
    i = 1
    j = length(arr)

    while true
        while arr[i] < pivot
            i += 1
        end
        while arr[j] > pivot
            j -= 1
        end
        if i >= j
            return j
        end
        arr[i], arr[j] = arr[j], arr[i]
        i += 1
        j -= 1
    end
end

function median(arr)
    n = length(arr)
    k = (n + 1) ÷ 2
    return quickselect(arr, k)
end

median([5, 3, 1, 4, 2, 6, 10]) # 4





