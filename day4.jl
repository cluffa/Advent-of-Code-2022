### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

# ╔═╡ 0a16e016-7b33-11ed-2ff3-e9ff89d46115
data = split(strip(read("input4.txt", String)), r"\n")

# ╔═╡ c608bdfe-5a8a-4f2a-885a-a4ca1304a13b
function toSet(rangeStr::AbstractString)
	first, second = parse.(Int, split(rangeStr, "-"))
	Set(first:second)
end

# ╔═╡ fc73cd73-da5b-4402-b83c-3525f3a0814a
function isFullOverlap(line::AbstractString)
	first, second = toSet.(split(line, ","))

	if first ⊆ second || second ⊆ first
		return 1
	else
		return 0
	end
end

# ╔═╡ c5ad713b-75da-48f4-8030-e56fb16fbea6
ans1 = isFullOverlap.(data) |> sum

# ╔═╡ 1168f664-6f26-4ad5-a9bc-b53be1bf9e28
function hasAnyOverlap(line::AbstractString)
	first, second = toSet.(split(line, ","))

	if length(intersect(first, second)) > 0
		return 1
	else
		return 0
	end
end

# ╔═╡ 42530d16-6326-4a0c-a0ac-d30fc657de65
ans2 = data .|> hasAnyOverlap |> sum

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
# ╠═c608bdfe-5a8a-4f2a-885a-a4ca1304a13b
# ╠═fc73cd73-da5b-4402-b83c-3525f3a0814a
# ╠═c5ad713b-75da-48f4-8030-e56fb16fbea6
# ╠═1168f664-6f26-4ad5-a9bc-b53be1bf9e28
# ╠═42530d16-6326-4a0c-a0ac-d30fc657de65
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
