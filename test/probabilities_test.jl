using Test
include("../src/Probabilities.jl")


@testset verbose = true "Probabilities" begin
	@testset "Probabilities.A" begin
		# 测试m为0的情况
		@test Probabilities.A(0, 1) == 1
		# 测试参数校验功能， m不能大于n，两者都不能为负数
		@test_throws ArgumentError Probabilities.A(0, 0) 
		@test_throws ArgumentError Probabilities.A(0, -1)
		@test_throws ArgumentError Probabilities.A(3, -1)
		@test_throws ArgumentError Probabilities.A(3, 2) 
		# 测试正常计算
		@test Probabilities.A(3, 3) == factorial(3)
		@test Probabilities.A(10, 10) == factorial(10)
		@test Probabilities.A(2, 3) == 6
		@test Probabilities.A(5, 12) == 95040
	end
	@testset "Probabilities.C" begin
		# 测试m为0的情况
		@test Probabilities.C(0, 1) == 1
		# 测试参数校验功能， m不能大于n，两者都不能为负数
		@test_throws ArgumentError Probabilities.C(0, 0) 
		@test_throws ArgumentError Probabilities.C(0, -1)
		@test_throws ArgumentError Probabilities.C(3, -1)
		@test_throws ArgumentError Probabilities.C(3, 2) 
		# 测试正常计算
		@test Probabilities.C(3, 3) == 1
		@test Probabilities.C(10, 10) == 1
		@test Probabilities.C(2, 3) == 3
		@test Probabilities.C(5, 12) == 792
	end
    	@testset "Probabilities.Binomial_Distribution" begin
		# 参数类型检查
		@test_throws MethodError Probabilities.Binomial_Distribution(10, 0)
		# 概率范围检查
		@test_throws ArgumentError Probabilities.Binomial_Distribution(10, 2.1)	
		@test_throws ArgumentError Probabilities.Binomial_Distribution(10, -0.2)	
	end
 
	@testset "Probabilities.Poisson_Distribution" begin
		@test Probabilities.Poisson_Distribution(1, 1)[1] ≈ ℯ^-1 
		@test Probabilities.Poisson_Distribution(200, 1)[1] ≈ ℯ^-1 
	end
    	
	@testset "Probabilities.Geometric_distribution" begin
		@test_throws ArgumentError Probabilities.Geometric_distribution(3, 2.1)
		@test Probabilities.Geometric_distribution(3, 0.9)[1] == 0.9
	end


end