function m_rank(A)
    m, n = size(A)  # размеры матрицы A
    rank = 0  # начальное значение ранга
    
    for j = 1:n  # итерация по столбцам
        pivot_found = false  # флаг для поиска ведущего элемента (пивота)
        
        for i = rank+1:m  # итерация по строкам, начиная с текущего ранга
            if A[i, j] != 0  # если найден ненулевой элемент
                pivot_found = true
                A[[i, rank+1], :] = A[[rank+1, i], :]  # меняем строки местами
                break
            end
        end
        
        if pivot_found
            pivot = A[rank+1, j]
            A[rank+1, :] /= pivot  # делим ведущую строку на ведущий элемент
            
            for i = rank+2:m  # обнуляем элементы под ведущим элементом
                factor = A[i, j]
                A[i, :] -= factor * A[rank+1, :]
            end
            
            rank += 1  # увеличиваем ранг
        end
    end
    
    return rank
end

A = [1 2 3; 4 5 6; 7 8 9; 10 11 12]
m_rank(A) #2

# 4×3 Matrix{Int64}:
#   1   2   3
#   4   5   6
#   7   8   9
#  10  11  12

# 2