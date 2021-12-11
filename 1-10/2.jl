function solve()
    arr = map(x -> split(x, " "), readlines("./2.txt"))
    horiz, aim, depth = 0, 0, 0
    for row in arr
        w, d = row[1], parse(Int, row[2])
        if w == "down"
            aim += d
        elseif w == "forward"
            horiz += d
            depth += aim * d
        elseif w == "up"
            aim -= d
        end
    end

    return horiz * depth

end

@time res = solve()
println(res)
    
