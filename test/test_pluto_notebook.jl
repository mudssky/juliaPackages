### A Pluto.jl notebook ###
# v0.14.8

using Markdown
using InteractiveUtils

# ╔═╡ 2a7aad52-ff4d-4f73-bcef-9f0f21530a19
using Plots

# ╔═╡ 63a8c687-91a8-4e95-8da7-7cde6cf7d7d6
using Test

# ╔═╡ fe6400dd-c198-4714-9f5e-1f3511f4dc6a
include("../src/probabilities.jl")

# ╔═╡ c0e0d90f-21d4-4a57-bb51-ed637d533929
plotly()

# ╔═╡ 646899f9-e0ad-4f56-b33a-2f1db011fdad
# begin
	# y=list
	# x=0:20
# end
plot(0:50,Probabilities.Binomial_Distribution(50,0.02))

# ╔═╡ 69f6117f-7d8a-448c-bf63-71e3f5315806
begin
	xmax=5
	plot(0:xmax,Probabilities.Poisson_Distribution(xmax,(2000*0.001)))
end

# ╔═╡ 6b077a31-6c28-4b62-85c4-f2126f412e27
Probabilities.Poisson_Distribution(200,(2000*0.001))

# ╔═╡ b9e711a0-3d44-4b2d-a69d-70988e9a3c7c
@test Probabilities.Poisson_Distribution(1,1)[1] ≈ ℯ^-1

# ╔═╡ Cell order:
# ╠═fe6400dd-c198-4714-9f5e-1f3511f4dc6a
# ╠═2a7aad52-ff4d-4f73-bcef-9f0f21530a19
# ╠═c0e0d90f-21d4-4a57-bb51-ed637d533929
# ╠═646899f9-e0ad-4f56-b33a-2f1db011fdad
# ╠═69f6117f-7d8a-448c-bf63-71e3f5315806
# ╠═6b077a31-6c28-4b62-85c4-f2126f412e27
# ╠═63a8c687-91a8-4e95-8da7-7cde6cf7d7d6
# ╠═b9e711a0-3d44-4b2d-a69d-70988e9a3c7c
