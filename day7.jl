### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

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
