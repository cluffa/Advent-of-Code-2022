### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

# ╔═╡ e61e9ca8-7d6c-11ed-14c6-4f6102d2480a
rps = read("./input2.txt", String) |>
	strip |>
	x -> split(x, r"\n")

# ╔═╡ 29ce5751-8d55-455b-ab72-ea19d9539ced
info = Dict(
	# my hand => pts, beats, loses to, ties
	"X" => [1, "C", "B", "A"],
	"Y" => [2, "A", "C", "B"],
	"Z" => [3, "B", "A", "C"]
)

# ╔═╡ ecfb4b8c-9f58-4e71-8ca0-dd1bc3c9a575
function pts(round)
	opo, me = split(round, " ")
	pts, win, loss, tie = info[me]

	if opo == win
		pts += 6
	elseif opo == tie
		pts += 3
	end

	return pts
end

# ╔═╡ 56329564-c05a-428c-8940-5606259979c4
ans1 = rps .|> pts |> sum

# ╔═╡ 930cb665-3f9c-4fae-bc20-8891c017ccfc
key1 = Dict(
	#win
	"Z" => [6, Dict(
		"A" => "B",
		"B" => "C",
		"C" => "A"
	)],
	#tie
	"Y" => [3, Dict(
		"A" => "A",
		"B" => "B",
		"C" => "C"
	)],
	#lose
	"X" => [0, Dict(
		"A" => "C",
		"B" => "A",
		"C" => "B"
	)],

)

# ╔═╡ 31b7a713-3f8c-433a-8078-a14f776cee54
points = Dict(
	"A" => 1,
	"B" => 2,
	"C" => 3
)

# ╔═╡ 0a8d0691-b80b-4586-84d9-871592a00720
function pts2(round)
	opo, me = split(round, " ")

	pts, key2 = key1[me]
	iplay = key2[opo]
	pts += points[iplay]

	return pts
end

# ╔═╡ 13b7c429-14c4-4ca7-940e-2783cb0cb620
ans2 = rps .|> pts2 |> sum

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
# ╠═e61e9ca8-7d6c-11ed-14c6-4f6102d2480a
# ╠═29ce5751-8d55-455b-ab72-ea19d9539ced
# ╠═ecfb4b8c-9f58-4e71-8ca0-dd1bc3c9a575
# ╠═56329564-c05a-428c-8940-5606259979c4
# ╠═930cb665-3f9c-4fae-bc20-8891c017ccfc
# ╠═31b7a713-3f8c-433a-8078-a14f776cee54
# ╠═0a8d0691-b80b-4586-84d9-871592a00720
# ╠═13b7c429-14c4-4ca7-940e-2783cb0cb620
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
