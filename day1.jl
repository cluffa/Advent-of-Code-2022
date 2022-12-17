### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

# ╔═╡ 51ff5589-b81e-4d0c-9a6f-1621aeb964e6
begin
    input = read("./input1.txt", String)
    input = strip(input)
    input = split(input, r"\n\n")
    input = split.(input, r"\n")

    input = map(x -> parse.(Int64, x), input)
    sums = sum.(input)

    maximum(sums)
end

# ╔═╡ 3186e27f-7373-4e0e-a83d-fa703a5ff914
sort(sums, rev = true)[1:3] |> sum

# ╔═╡ Cell order:
# ╠═51ff5589-b81e-4d0c-9a6f-1621aeb964e6
# ╠═3186e27f-7373-4e0e-a83d-fa703a5ff914
