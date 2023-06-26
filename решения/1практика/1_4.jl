function gcdx_(a::T, b::T) where T # - это означает, что тип обоих аргументов один и тот же
    # a0, b0 = a, b
    u, v = one(T), zero(T) # - универсальнее, чем 1, 0 и гарантирует стабильность типов переменных
    u_, v_ = v, u
    #ИНВАРИАНТ: НОД(a,b) = HОД(a0,b0) && a = u*a0 + v*b0 && b = u_*a0 + v_ * b0
    while !iszero(b) # - это условие более универсальное, чем b != 0 или b > 0. Функция iszero определена для всех числовых типов. Для пользовательских типов ее надо будет определять
        r, k = remdiv(a, b) # remdiv(a,b) возвращает кортеж из rem(a,b) и div(a,b)
        a, b = b, r #  r = a - k*b
        u, u_ = u_, u-k*u_ # эти преобразования переменных следуют из инварианта цикла
        v, v_ = v_, v-k*v_
    end
    if isnegative(a) #  использование функции isnegative делает данный алгоритм более универсальным, но эту функцию требуется определить, в том числе и для целых типов
        a, u, v = -a, -u, -v
    end
    return a, u, v 
end

function remdiv(a::T, b::T) where T
    r = rem(a, b)
    k = div(a, b)
    return r, k
end

function diophant_solve(a::T, b::T, c::T) where T
    d, u, v = gcdx_(a, b)
    if d != one(T)
        return nothing
    else
        x = c * u
        y = c * v
        return x, y
    end
end

isnegative(a::Integer) = (a < 0)

diophant_solve(7, 11, 30) #(-90, 60)