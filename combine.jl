begin
    file = read("day1.jl", String)

    secs = findall("# ╔═╡ Cell order:", file)[1]

    code = split(file[1:secs[1]-2], r"\n")
    ids = split(file[secs[1]:end] |> strip, r"\n")

    for i in 2:7
        f = read("day$i.jl", String)
        codestart = findfirst("# ╔═╡", f)[1]
        splitter = findfirst("# ╔═╡ Cell order:", f)
        codestop = splitter[1] - 1
        idstart = splitter[end] + 1

        append!(code, split(f[codestart:codestop], r"\n"))
        append!(ids, split(strip(f[idstart:end]), r"\n"))
        
    end

    io = open("test.txt", "w") do io
        for lines in code
            println(io, lines)
        end

        for id in ids
            println(io, id)
        end
    end
      
end

println(code)
