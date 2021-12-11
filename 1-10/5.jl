function solve()
    arr = readlines("./5.txt")
    pairs = map(x -> map(w -> split(w, ","), split(x, " -> ")), arr)
    
    vents = zeros(Int8, 1000, 1000)
    for i = 1:size(pairs, 1)
        # convert nums to 1-indexed lol
        x1, y1 = map(x -> parse(Int, x) + 1, pairs[i][1])
        x2, y2 = map(x -> parse(Int, x) + 1, pairs[i][2])
        if x1 == x2
            for y = min(y1, y2):max(y1, y2)
                increment(vents, x1, y)
            end
        elseif y1 == y2
            for x = min(x1, x2):max(x1, x2)
                increment(vents, x, y1)
            end
        elseif abs(x1 - x2) == abs(y1 - y2)
            isincreasing = (x2 > x1) == (y2 > y1)
            for n = 0:abs(x1 - x2)
                dy = isincreasing ? min(y1, y2) + n : max(y1, y2) - n
                increment(vents, min(x1, x2) + n, dy)
            end
        end

        # display(vents)
    end
    return count(v -> v > 1, vents)
end

@inline increment(arr, x, y) = arr[x, y] += 1
@time res = solve()
println(res)
