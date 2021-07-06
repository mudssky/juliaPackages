using Test
include("../src/probabilities.jl")


@testset verbose = true "probabilities" begin
	@testset "probabilities.A" begin
		# 测试m为0的情况
		@test probabilities.A(0, 1) == 1
		# 测试参数校验功能， m不能大于n，两者都不能为负数
		@test_throws ArgumentError probabilities.A(0, 0) 
		@test_throws ArgumentError probabilities.A(0, -1)
		@test_throws ArgumentError probabilities.A(3, -1)
		@test_throws ArgumentError probabilities.A(3, 2) 
		# 测试正常计算
		@test probabilities.A(3, 3) == factorial(3)
		@test probabilities.A(10, 10) == factorial(10)
		@test probabilities.A(2, 3) == 6
		@test probabilities.A(5, 12) == 95040
	end
	@testset "probabilities.C" begin
		# 测试m为0的情况
		@test probabilities.C(0, 1) == 1
		# 测试参数校验功能， m不能大于n，两者都不能为负数
		@test_throws ArgumentError probabilities.C(0, 0) 
		@test_throws ArgumentError probabilities.C(0, -1)
		@test_throws ArgumentError probabilities.C(3, -1)
		@test_throws ArgumentError probabilities.C(3, 2) 
		# 测试正常计算
		@test probabilities.C(3, 3) == 1
		@test probabilities.C(10, 10) == 1
		@test probabilities.C(2, 3) == 3
		@test probabilities.C(5, 12) == 792
	end
    	@testset "probabilities.Binomial_Distribution" begin
		# 参数类型检查
		@test_throws MethodError probabilities.Binomial_Distribution(10, 0)
		# 概率范围检查
		@test_throws ArgumentError probabilities.Binomial_Distribution(10, 2.1)	
		@test_throws ArgumentError probabilities.Binomial_Distribution(10, -0.2)	
	end
end