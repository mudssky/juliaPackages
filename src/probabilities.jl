
# factorial()
"""
计算排列数 A_n^m
"""
function A(m, n)
    if n < m
        return -1
    
    elseif (n == m)
        return factorial(n)
    
    else
        if min(m, n) > 20
        return factorial(big(n)) / factorial(big(n - m)) 
        else
            return factorial(n) / factorial(n - m)
        end
        end
end