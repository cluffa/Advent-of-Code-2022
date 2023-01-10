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


# ╔═╡ a61f2810-7d72-11ed-3768-dd9bdd10b391
begin
	game, instuctions = split(read("input5.txt", String), r"\n\n");
	instuctions = split(strip(instuctions), r"\n");
end

# ╔═╡ ae1805e6-41c9-4f07-a6b1-2226deac7674
Text(game)

# ╔═╡ 4bd66cde-c9bd-494a-bdf6-a96a4bee4365
lines = reverse(split(game, r"\n"))

# ╔═╡ deeff3cb-98bd-4882-8b2f-a828b005f877
function getStack(num)
	loc = (num - 1) * 4 + 2
	out = []
	for line in lines[2:end]
		crate = line[loc]
		if crate == ' '
			break
		end
		append!(out, crate)
	end
	return out
end

# ╔═╡ 6d93c8fb-3a49-4691-8b5d-10f1361b4760
function simplify(line)
	out = filter(!isletter, line)
	out = split(out, "  ")
	out = strip.(out)
	out = parse.(Int, out)
end

# ╔═╡ 74834f25-62a3-43dd-a21a-86719788edfd
steps = simplify.(instuctions)

# ╔═╡ 755cfd87-fb8c-4f64-ba83-307225ecbf98
function makeMove!(from, to, s, num = 1, rev = false)
	@assert length(s[from]) > 0

	crates = []
	for _ in 1:num
		append!(crates, pop!(s[from]))
	end

	if rev
		crates = reverse(crates)
	end

	append!(s[to], crates)

	return nothing
end

# ╔═╡ 63e6f690-cc36-4a48-8d8b-09bccbae762c
begin
	newstacks = getStack.(1:9)
	for (i, to, from) in steps
		for _ in 1:i
			makeMove!(to, from, newstacks)
		end
	end
	newstacks
end

# ╔═╡ 34a086ff-17d2-44e1-9ea3-32696e0ddb98
ans1 = newstacks .|> 
	last |>
	x -> string(x...)

# ╔═╡ 2ed21ce0-e793-496a-bee5-c5c580cd899b
begin
	newnewstacks = getStack.(1:9)
	for (i, to, from) in steps
		makeMove!(to, from, newnewstacks, i, true)
	end
	newnewstacks
end

# ╔═╡ dc265bba-5239-4677-ae20-694263330011
ans2 = newnewstacks .|>
	last |>
	x -> string(x...)


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


# ╔═╡ 24b64ef6-e57d-4a35-a109-9408d77cc7b5
history = read("input7.txt", String) |> strip |> x -> split(x, r"\n")

# ╔═╡ 59c43f31-f239-4593-9b4f-ec5a286f21f0
mutable struct Dir
	name
	location
	contents
	size
end

# ╔═╡ 6d556dba-9440-479c-b2c8-2b49f4a9911e
mutable struct File
	name
	location
	size
end

# ╔═╡ 6227a026-37ed-45b2-a592-ce93477842a7
size(f::File) = f.size

# ╔═╡ 8420d69e-ef7c-49a8-9685-fa69284942c5
function size(d::Dir)
	if length(d.contents) > 0
		return sum(size.(d.contents))
	else
		return 0
	end
end

# ╔═╡ 4501668b-2a35-41c7-a24a-8b26cbb4a92f
function newFile(s, cd)
	size, name = split(s, " ")
	return File(name, cd, parse(Int, size))
end

# ╔═╡ 9d543138-7e4c-4f11-84a4-bad6cf47894f
function newDir(s, cd)
	name = split(s, " ")[2]
	return Dir(name, cd, [], 0)
end

# ╔═╡ ef9e4a51-bf03-4644-9b4b-e4d23f433eea
function goTo(cd, name)
	for item in cd.contents
		if item.name == name
			typeassert(item, Dir)
			return item
		end
	end
end

# ╔═╡ a9843e02-7f3c-428b-96c7-c3ce057cdb9c
function process(lines)
	cd = Dir("/", nothing, [], 0)

	i = 2
	while i < length(lines)
		if contains(lines[i], "\$ ls")
			i += 1
			while !contains(lines[i], "\$ cd") && i < length(lines)
				if split(lines[i], " ")[1] == "dir"
					append!(cd.contents, (newDir(lines[i], cd), ))
					#println("$i added dir $(cd.contents[end].name)")
				else
					append!(cd.contents, (newFile(lines[i], cd), ))
					#cd.size += cd.contents[end].size
					#println("$i added file $(cd.contents[end].name)")
				end
				i += 1
			end
		end
		
		if contains(lines[i], "\$ cd")
			newdir = split(lines[i], " ")[end]
			if newdir == ".."
				println("$i going up 1 dir")
				cd = cd.location
			else
				println("$i going to dir $newdir")
				cd = goTo(cd, newdir)
			end
			i += 1
		end
	end

	while !isnothing(cd.location)
		cd = cd.location
	end
	return cd
end

# ╔═╡ 4f58f221-3cd8-4970-a5f6-c6e7f923afd0
cd = process(history)

# ╔═╡ 10ac5490-6b59-4445-8623-53d0cb4b9d67
size(cd)

# ╔═╡ 76e72e50-0fa9-4834-8574-5f04da39ed06
function printt(f::File, indent = 0)
	println("    "^indent * f.name)
	return f.size
end

# ╔═╡ a8b1e5ba-402d-49aa-a624-548d7bad0fe0
function printt(d::Dir, indent = 0)
	s = 0
	println("    "^indent * d.name)
	for item in d.contents
		s += printt(item, indent + 1)
	end
	return s
end

# ╔═╡ e279eb2f-4909-45bb-b6a0-abada38ed64e
printt(cd)

# ╔═╡ c7c5f27b-061b-4d54-994b-2c36c1eff38b
function addDirs(d, ts)
	t = 0
	if d isa Dir
		s = size(d)
		if s <= 100_000
			t += s
		end

		for item in d.contents
			t += addDirs(item, ts)
		end
	end

	return ts + t
end

# ╔═╡ 81eb4123-a6a6-4b1d-9bea-eb9a1a23b232
ans1 = addDirs(cd, 0)

# ╔═╡ 4322902c-d974-40d8-a6c2-5758d0d7d1fd
function findDirs(d, sizes)
	out = []
	if d isa Dir
		append!(out, size(d))

		for item in d.contents
			append!(out, findDirs(item, sizes))
		end
	end

	return out
end

# ╔═╡ 91e1f424-775d-4717-bd89-7b32eb5c1373
atleast = - 70_000_000 + 30_000_000 + size(cd)

# ╔═╡ 30e2450d-3a76-42c4-8a38-c2693a470b31
dirs = findDirs(cd, [])

# ╔═╡ 6cbc55d4-6d7a-4761-b241-640d3b1daad2
ans2 = dirs[dirs .> atleast] |> minimum

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
# ╠═51ff5589-b81e-4d0c-9a6f-1621aeb964e6
# ╠═3186e27f-7373-4e0e-a83d-fa703a5ff914
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
# ╠═4b852550-7b2c-11ed-2f35-073fe8e94ad7
# ╠═93e249e3-ddf3-4e72-986f-0897b0427610
# ╠═488daa06-89da-4cab-b0b0-fe74246e6e96
# ╠═286b40e8-94a9-49a9-9a5c-309200f4c6f8
# ╠═afdd29db-44ce-4571-a30e-424415e3537b
# ╠═52e5a1ca-81c7-473b-92d6-274082bc36a3
# ╠═f321fc28-9fff-46f4-b210-83ded18a681c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
# ╠═0a16e016-7b33-11ed-2ff3-e9ff89d46115
# ╠═c608bdfe-5a8a-4f2a-885a-a4ca1304a13b
# ╠═fc73cd73-da5b-4402-b83c-3525f3a0814a
# ╠═c5ad713b-75da-48f4-8030-e56fb16fbea6
# ╠═1168f664-6f26-4ad5-a9bc-b53be1bf9e28
# ╠═42530d16-6326-4a0c-a0ac-d30fc657de65
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
# ╠═a61f2810-7d72-11ed-3768-dd9bdd10b391
# ╠═ae1805e6-41c9-4f07-a6b1-2226deac7674
# ╠═4bd66cde-c9bd-494a-bdf6-a96a4bee4365
# ╠═deeff3cb-98bd-4882-8b2f-a828b005f877
# ╠═6d93c8fb-3a49-4691-8b5d-10f1361b4760
# ╠═74834f25-62a3-43dd-a21a-86719788edfd
# ╠═755cfd87-fb8c-4f64-ba83-307225ecbf98
# ╠═63e6f690-cc36-4a48-8d8b-09bccbae762c
# ╠═34a086ff-17d2-44e1-9ea3-32696e0ddb98
# ╠═2ed21ce0-e793-496a-bee5-c5c580cd899b
# ╠═dc265bba-5239-4677-ae20-694263330011
# ╠═59c43f31-f239-4593-9b4f-ec5a286f21f0
# ╠═88409721-6b41-46a9-a0d1-5dfe8653922e
# ╠═3cb217f0-fc2f-4510-b936-c5876d2b23ea
# ╠═a66ee016-ae9c-4885-913a-beb264b09b53
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
# ╠═24b64ef6-e57d-4a35-a109-9408d77cc7b5
# ╠═59c43f31-f239-4593-9b4f-ec5a286f21f0
# ╠═6d556dba-9440-479c-b2c8-2b49f4a9911e
# ╠═6227a026-37ed-45b2-a592-ce93477842a7
# ╠═8420d69e-ef7c-49a8-9685-fa69284942c5
# ╠═4501668b-2a35-41c7-a24a-8b26cbb4a92f
# ╠═9d543138-7e4c-4f11-84a4-bad6cf47894f
# ╠═ef9e4a51-bf03-4644-9b4b-e4d23f433eea
# ╠═a9843e02-7f3c-428b-96c7-c3ce057cdb9c
# ╠═4f58f221-3cd8-4970-a5f6-c6e7f923afd0
# ╠═10ac5490-6b59-4445-8623-53d0cb4b9d67
# ╠═76e72e50-0fa9-4834-8574-5f04da39ed06
# ╠═a8b1e5ba-402d-49aa-a624-548d7bad0fe0
# ╠═e279eb2f-4909-45bb-b6a0-abada38ed64e
# ╠═c7c5f27b-061b-4d54-994b-2c36c1eff38b
# ╠═81eb4123-a6a6-4b1d-9bea-eb9a1a23b232
# ╠═4322902c-d974-40d8-a6c2-5758d0d7d1fd
# ╠═91e1f424-775d-4717-bd89-7b32eb5c1373
# ╠═30e2450d-3a76-42c4-8a38-c2693a470b31
# ╠═6cbc55d4-6d7a-4761-b241-640d3b1daad2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
