module Probabilities
using Base:Integer, AbstractFloat

include("CheckArgument.jl")

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

"""
计算二项分布的列表
其中参数n为发生次数，p为单次独立事件的概率
Binomial_Distribution(n::Integer, p)
返回值是一个列表
"""
function Binomial_Distribution(n::Integer, p::AbstractFloat)
    check_probabilities(p) 
    resList = []
	for k = 0:n
		# @info(k)
		push!(resList, C(k, n) * p^k * (1 - p)^(n - k))
	end
	return resList
end

"""
泊松分布
λᵏℯ^λ / k!,k=0,1,2
λ=n⋅p
function Poisson_Distribution(num::Integer, λ)
"""
function Poisson_Distribution(range::AbstractRange, λ::Real)
    check_is_nonnegative(λ, range[1])
    resList = []
    for k in range
        push!(resList, λ^k * ℯ^-λ / factorial(big(k)))
    end
    return resList
end

"""
    几何分布
他的每一项为 (1-p)^(k-1)*p
起始项为k=1zz
function Geometric_distribution(num::Integer, p::AbstractFloat)
"""
function Geometric_distribution(range::AbstractRange, p::AbstractFloat)
    check_probabilities(p)
    check_is_nonnegative(range[1])
    resList = []
    for k in range
        push!(resList, p * (1 - p)^(k - 1))
    end
    return resList
end

"""
    超几何分布
从N件产品（其中次品M件）中任取n件，k为取到的次品数

p{x=k}=C(k,M)C(n-k,n-M)/C(n,N)
"""
function Hypergeometric_Distribution(n::Integer, N::Integer, k::Integer, M::Integer)
    if !(0 <= k <= n <= N  && k <= M)
        throw(ArgumentError("0 <= k <= n <= N  &&k <= M"))
    end
    return C(k, M) * C(n - k, n - M) / C(n, N)
end

"""
    正态分布
function Normal_Distribution_pdf(range::AbstractRange, μ, σ)
"""
function Normal_Distribution_pdf(range::AbstractRange, μ::Real, σ::Real)
check_not_empty(range)
    check_is_nonnegative(μ)
    resList = []
    for x in range
        constant = 1 / (sqrt(2π) * σ)
        push!(resList, constant * ℯ^(-(x - μ)^2 / (2 * σ^2)))
    end
    return resList
end

"""
    指数分布 概率密度函数

function Exponential_Distribution(range::AbstractRange, θ::Real)
"""
function Exponential_Distribution_pdf(range::AbstractRange, θ::Real)
    check_not_empty(range)
    check_is_nonnegative(range[1])
    resList = []
    for x in range
        push!(resList, (1 / θ) * ℯ^(-x / θ))
    end
    return resList
end     

"""
    指数分布
function Exponential_Distribution(range::AbstractRange, θ::Real)
"""
function Exponential_Distribution(range::AbstractRange, θ::Real)
    check_not_empty(range)
    check_is_nonnegative(range[1])
    resList = []
    for x in range
        push!(resList, 1 - ℯ^(-x / θ))
    end
    return resList
end 
export A,C
end