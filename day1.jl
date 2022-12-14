### A Pluto.jl notebook ###
# v0.19.15

using Markdown
using InteractiveUtils

# ╔═╡ 92845454-5def-4b92-a58d-593435da6970
md"""
# Day 1
"""

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

# ╔═╡ 10abcd0b-0b1a-4435-b5e7-05240fcfb916
md"""
# Day 2
"""

# ╔═╡ f464e3a1-aaec-40d3-bd01-f80bd64bb33a


# ╔═╡ e5e8ff4b-7b32-4095-babd-5094d7e789db
rpc = read("./input2.txt", String) |>
	strip |>
	x -> split(x, r"\n") |>
	x -> split.(x, " ")

# ╔═╡ d5fb8b05-ff3a-4d06-8b6c-ff041534dcc6
begin
	combs = []
	for i in ["A", "B", "C"]
		for j in ["X", "Y", "Z"]
			append!(combs,[[i, j,],])
		end
	end
	combs
end

# ╔═╡ 5f9810df-e488-400c-9c1a-d3d04dc9b379


# ╔═╡ dc11bcb2-6cbe-44d9-89cb-f7bde6efd47d
begin
	score = 0
	for round in rpc
		op, me = round
		if op == "A"
			if me == "X"
				score += 3
			elseif me == "Y"
				score += 6
			elseif me == "Z"
				score += 0
			end
		elseif op == "B"
			# TODO
		elseif op == "C"
		end
	end
	score
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.0-DEV"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╟─92845454-5def-4b92-a58d-593435da6970
# ╠═51ff5589-b81e-4d0c-9a6f-1621aeb964e6
# ╠═3186e27f-7373-4e0e-a83d-fa703a5ff914
# ╟─10abcd0b-0b1a-4435-b5e7-05240fcfb916
# ╠═f464e3a1-aaec-40d3-bd01-f80bd64bb33a
# ╠═e5e8ff4b-7b32-4095-babd-5094d7e789db
# ╠═d5fb8b05-ff3a-4d06-8b6c-ff041534dcc6
# ╠═5f9810df-e488-400c-9c1a-d3d04dc9b379
# ╠═dc11bcb2-6cbe-44d9-89cb-f7bde6efd47d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
