function comb_sort!(arr)
    n = length(arr)
    gap = n
    shrink = 1.3
    sorted = false

    while !sorted
        gap = Int(floor(Float64(gap) / shrink))
        if gap <= 1
            gap = 1
            sorted = true
        end

        i = 1
        while i + gap <= n
            if arr[i] > arr[i+gap]
                arr[i], arr[i+gap] = arr[i+gap], arr[i]
                sorted = false
            end
            i += 1
        end
    end
end

function comb_sort(arr)
    sorted_arr = copy(arr)
    comb_sort!(sorted_arr)
    return sorted_arr
end

function bubble_sort(arr)
    n = length(arr)
    for i in 1:n-1
        swapped = false
        for j in 1:n-i
            if arr[j] > arr[j+1]
                arr[j], arr[j+1] = arr[j+1], arr[j]
                swapped = true
            end
        end
        if !swapped
            break
        end
    end
    return arr
end

arr = rand(10^6)

@time comb_sort!(arr) #  0.149666 seconds
@time bubble_sort(arr) # 0.017822 seconds