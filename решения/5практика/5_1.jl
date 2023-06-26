function insertion_sort!(arr)
    for i = 2:length(arr)
        key = arr[i]
        j = i - 1
        while j >= 1 && arr[j] > key
            arr[j+1] = arr[j]
            j -= 1
        end
        arr[j+1] = key
    end
end

function insertion_sortperm(arr)
    indices = collect(1:length(arr))
    for i = 2:length(arr)
        key = arr[i]
        index = indices[i]
        j = i - 1
        while j >= 1 && arr[j] > key
            arr[j+1] = arr[j]
            indices[j+1] = indices[j]
            j -= 1
        end
        arr[j+1] = key
        indices[j+1] = index
    end
    return indices
end

function insertion_sort(arr)
    sorted_arr = copy(arr)
    insertion_sort!(sorted_arr)
    return sorted_arr
end

function sort!(arr)
    insertion_sort!(arr)
end

function sort(arr)
    sorted_arr = copy(arr)
    insertion_sort!(sorted_arr)
    return sorted_arr
end

function sortperm!(arr)
    insertion_sortperm(arr)
end

function sortperm(arr)
    return insertion_sortperm(copy(arr))
end