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

function insertion_sort(arr)
    n = length(arr)
    for i in 2:n
        key = arr[i]
        j = i - 1
        while j >= 1 && arr[j] > key
            arr[j+1] = arr[j]
            j -= 1
        end
        arr[j+1] = key
    end
    return arr
end

arr = rand(10^6)

@time shell!(arr) # 0.282254 seconds
@time insertion_sort(arr) # 0.029510 seconds