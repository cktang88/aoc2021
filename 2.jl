# readlines has a lot better control than DelimitedFiles.readdlm
arr = readlines("./2.txt") 
arr = map(x -> split(x, " "), arr)
function solve()
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
print(res)
    
