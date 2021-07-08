# module CheckArgument
    
"""
	参数检查 概率范围检查
	概率需要在0到1之间，否则抛出参数错误
"""
function check_probabilities(p::AbstractFloat)
    if p > 1 || p < 0
throw(ArgumentError("p should be between 0-1"))
end
end

"""
	参数检查 非负性检查
	如果检查项目不是非负数，抛出参数错误
"""
function check_is_nonnegative(nums::Real...)
    for n in nums
        if n < 0
            throw(ArgumentError("$n should be nonnegative"))
        end
    end
end

        """
    检测range是否为空
"""
function check_not_empty(ranges::AbstractRange...)
    for r in ranges
        if length(r) <= 0
            throw(ArgumentError("range should not be empty"))
        end
    end
end
# export check_is_nonnegative,check_probabilities
# end