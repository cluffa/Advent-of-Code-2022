### A Pluto.jl notebook ###
# v0.19.17

using Markdown
using InteractiveUtils

# ╔═╡ 0a16e016-7b33-11ed-2ff3-e9ff89d46115
data = split(strip(read("input4.txt", String)), r"\n")

# ╔═╡ 20598721-cff5-42b7-9019-673115954c5a
data2 = split.(data, ",")

# ╔═╡ ade2d777-f2f2-43c1-b171-336873c23c2b
data3 = split.(mapreduce(permutedims, vcat, data2), "-")

# ╔═╡ 2be14f19-242e-403a-8c19-53e3cf912a10
mapreduce(permutedims, vcat, data3)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.0-alpha1"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═0a16e016-7b33-11ed-2ff3-e9ff89d46115
# ╠═20598721-cff5-42b7-9019-673115954c5a
# ╠═ade2d777-f2f2-43c1-b171-336873c23c2b
# ╠═2be14f19-242e-403a-8c19-53e3cf912a10
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
