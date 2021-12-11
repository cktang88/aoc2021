function solve()
    arr = readlines("./10.txt")
    starts = "([{<"
    # display(arr)
    stops = Dict('(' => ')', '[' => ']', '{' => '}', '<' => '>')
    # vals = Dict(')' => 3, ']' => 57, '}' => 1197, '>' => 25137)
    vals = Dict(')' => 1, ']' => 2, '}' => 3, '>' => 4)

    arr2 = filter(e -> !iscorrupt(e, starts, stops), arr)
    scores = []
    for row in arr2
        completion = complete(row, starts, stops)
        score = 0
        for c in completion
            score = score * 5 + get(vals, c, missing)
        end
        push!(scores, score)
    end
    scores = sort(scores)
    ans = scores[Int64(ceil(length(scores) // 2))]
    return ans
end
function iscorrupt(row, starts, stops)
    cur = []
    for c in row
        if c in starts
            push!(cur, c)
        else
            storeval = pop!(cur)
            if get(stops, storeval, missing) != c
                return true
            end
        end
    end
    return false
end
function complete(row, starts, stops)
    cur = []
    for c in row
        if c in starts
            push!(cur, c)
        else
            pop!(cur)
        end
    end
    res = []
    c = missing
    while length(cur) > 0
        push!(res, get(stops, pop!(cur), missing))
    end
    return res
end
@time res = solve()
println(res)

