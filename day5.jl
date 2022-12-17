### A Pluto.jl notebook ###
# v0.19.18

using Markdown
using InteractiveUtils

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

# ╔═╡ Cell order:
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
