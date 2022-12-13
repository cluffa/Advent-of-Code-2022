### A Pluto.jl notebook ###
# v0.19.17

using Markdown
using InteractiveUtils

# ╔═╡ 4b852550-7b2c-11ed-2f35-073fe8e94ad7
data = split(strip(read("input3.txt", String)), r"\n")

# ╔═╡ 93e249e3-ddf3-4e72-986f-0897b0427610
begin
	priorities = Dict()
	priority = 1
	for i in 'a':'z'
		priorities[i] = priority
		priority += 1
	end

	for i in 'A':'Z'
		priorities[i] = priority
		priority += 1
	end
	priorities
end

# ╔═╡ 488daa06-89da-4cab-b0b0-fe74246e6e96
function half(str)
	n = length(str)
	@assert n % 2 == 0
	return (str[1:Int(n/2)], str[Int(n/2+1):end])
end

# ╔═╡ 286b40e8-94a9-49a9-9a5c-309200f4c6f8
function match(strtup)
	sets = Set.(strtup)
	m = intersect(sets...)
	@assert length(m) == 1 "$m"
	return pop!(m)
end

# ╔═╡ afdd29db-44ce-4571-a30e-424415e3537b
matches = data .|> half .|> match

# ╔═╡ 52e5a1ca-81c7-473b-92d6-274082bc36a3
ans1 = sum([priorities[match] for match in matches])

# ╔═╡ f321fc28-9fff-46f4-b210-83ded18a681c
ans2 = sum([priorities[match(data[i:(i+2)])] for i in 1:3:length(data)])

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
# ╠═4b852550-7b2c-11ed-2f35-073fe8e94ad7
# ╠═93e249e3-ddf3-4e72-986f-0897b0427610
# ╠═488daa06-89da-4cab-b0b0-fe74246e6e96
# ╠═286b40e8-94a9-49a9-9a5c-309200f4c6f8
# ╠═afdd29db-44ce-4571-a30e-424415e3537b
# ╠═52e5a1ca-81c7-473b-92d6-274082bc36a3
# ╠═f321fc28-9fff-46f4-b210-83ded18a681c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
