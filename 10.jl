function solve()
    arr = readlines("./10.txt")
    starts = "([{<"
    # display(arr)
    stops = Dict('(' => ')', '[' => ']', '{' => '}', '<' => '>')
    vals = Dict(')' => 3, ']' => 57, '}' => 1197, '>' => 25137)
    ans = 0
    for row in arr
        cur = []
        println(row)
        for c in row
            if c in starts
                push!(cur, c)
            else
                storeval = pop!(cur)
                if get(stops, storeval, missing) != c
                    println(get(stops, storeval, missing), " != ", c)
                    ans += get(vals, c, 0)
                    break
                end
            end
        end
    end
    return ans
end
@time res = solve()
println(res)

