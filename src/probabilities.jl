module probabilities
using Base:Integer

"""
计算排列数 A_n^m,输入需要是整数类型，返回值是BigInt类型，因为排列数很容易变成大数
"""
function A(m::Integer, n::Integer)
    # basic param check
     if n < m
        throw(ArgumentError("n should be lager than m"))
    elseif n <= 0 || m < 0
        throw(ArgumentError("n or m should not be zero or negative"))
    elseif m == 0 return 1
            end

    function A_inner(m, n)
        if (m <= 1)
            return n
        end
        return A_inner(m - 1, n - 1) * n
    end
    return A_inner(BigInt(m), BigInt(n))
end

"""
计算组合数
"""
function C(m::Integer, n::Integer)
    # basic param check
    if n < m
        throw(ArgumentError("n should be lager than m"))
    elseif n <= 0 || m < 0
        throw(ArgumentError("n or m should not be zero or negative"))
    elseif m == 0 return 1
        end
    return A(BigInt(m), BigInt(n)) / factorial(BigInt(m))
end


export A,C
end