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

isnegative(a::Integer) = (a < 0)

struct Residue{T,M}
    a::T
    function Residue{T,M}(a) where {T,M}
        return new(mod(a, M))
    end
end

import Base: +, -, *, ^, inv, display

function +(x::Residue{T,M}, y::Residue{T,M}) where {T,M}
    return Residue{T,M}(x.a + y.a)
end

function -(x::Residue{T,M}, y::Residue{T,M}) where {T,M}
    return Residue{T,M}(x.a - y.a)
end

function -(x::Residue{T,M}) where {T,M}
    return Residue{T,M}(-x.a)
end

function *(x::Residue{T,M}, y::Residue{T,M}) where {T,M}
    return Residue{T,M}(x.a * y.a)
end

function ^(x::Residue{T,M}, n::Integer) where {T,M}
    return Residue{T,M}(x.a ^ n)
end

function inv(x::Residue{T,M}) where {T,M}
    d, u = gcdx_(x.a, M)
    if d != one(T)
       return nothing
    else
        return Residue{T,M}(u)
    end
end

function display(x::Residue{T,M}) where {T,M}
    println("Residue{$T,$M}($x.a mod $M)")
end

M = 7

a = Residue{Int64,M}(3)
b = Residue{Int64,M}(5)

c = a + b
d = a - b
e = -a
f = a * b
g = a ^ 3
h = inv(a)

display(c)
display(d)
display(e)
display(f)
display(g)
display(h)