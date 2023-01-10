### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

# ╔═╡ cbff7d75-f8bc-4e44-abd1-051f88355700
using DelimitedFiles

# ╔═╡ a3922c6c-7e46-11ed-06ba-6be402990ccc
s = split.(split(read("input8.txt", String) |> strip, r"\n"), "")

# ╔═╡ 2416558c-263e-4d90-a2b2-41be2bb149a7
trees = parse.(Int, mapreduce(permutedims, vcat, s))

# ╔═╡ 2832e284-79cb-452f-98ba-2aae1472e1bf
data = fill(-1, 101, 101); data[2:100, 2:100] = trees; data

# ╔═╡ e9257784-5a26-4466-9533-7cfa477e7a5b
canBeSeen = [
	data[i, j] > min(
		maximum(data[1: i - 1, j]),
		maximum(data[i + 1:end, j]),
		maximum(data[i, 1: j - 1]),
		maximum(data[i, j + 1:end])
	) for i in 2:100, j in 2:100
]

# ╔═╡ 33fa433e-4915-4a34-be2e-ffe5a37abca4
ans1 = sum(canBeSeen)

# ╔═╡ 01ff38c3-9fdc-4ff1-88aa-ea76c0d7464a
function dirScore(v)
	if length(v) > 1
		d = diff(v)
		c = cumsum(d)
	else
		return 0
	end
end

# ╔═╡ ab146ce0-2139-4eaf-8679-220c89e1ae75
dirScore([5, 1, 4, 3, 5, 6, 3])

# ╔═╡ 012ddf8f-44de-4203-bce2-d1920c5699db
function scenicScore(i, j)
	
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[compat]
DelimitedFiles = "~1.9.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.0-alpha1"
manifest_format = "2.0"
project_hash = "739f2f3af706c750957bd6ec39e0874ba8eb265d"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
git-tree-sha1 = "19b1417ff479c07e523fcbf2fd735a3fde3d1ab3"
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"
version = "1.9.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
"""

# ╔═╡ Cell order:
# ╠═cbff7d75-f8bc-4e44-abd1-051f88355700
# ╠═a3922c6c-7e46-11ed-06ba-6be402990ccc
# ╠═2416558c-263e-4d90-a2b2-41be2bb149a7
# ╠═2832e284-79cb-452f-98ba-2aae1472e1bf
# ╠═e9257784-5a26-4466-9533-7cfa477e7a5b
# ╠═33fa433e-4915-4a34-be2e-ffe5a37abca4
# ╠═01ff38c3-9fdc-4ff1-88aa-ea76c0d7464a
# ╠═ab146ce0-2139-4eaf-8679-220c89e1ae75
# ╠═012ddf8f-44de-4203-bce2-d1920c5699db
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
