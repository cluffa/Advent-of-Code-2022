### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

# ╔═╡ 59c43f31-f239-4593-9b4f-ec5a286f21f0
data = read("input6.txt", String) |> strip

# ╔═╡ 88409721-6b41-46a9-a0d1-5dfe8653922e
function findStart(stream, num = 4)
	offset = num - 1
	n = length(stream)
	for i in 1:(n - offset)
		if allunique(stream[i:(i+offset)])
			return i + offset
		end
	end
end

# ╔═╡ 3cb217f0-fc2f-4510-b936-c5876d2b23ea
ans1 = findStart(data)

# ╔═╡ a66ee016-ae9c-4885-913a-beb264b09b53
ans2 = findStart(data, 14)

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
# ╠═59c43f31-f239-4593-9b4f-ec5a286f21f0
# ╠═88409721-6b41-46a9-a0d1-5dfe8653922e
# ╠═3cb217f0-fc2f-4510-b936-c5876d2b23ea
# ╠═a66ee016-ae9c-4885-913a-beb264b09b53
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
