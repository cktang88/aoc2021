using DelimitedFiles
arr = readdlm("./5.txt", ) # reads into matrix

function solve()
    pairs = map(x -> split(x, ","), arr)
    
    vents = zeros(Int8, 1000, 1000)
    for i = 1:size(pairs, 1)
        # convert nums to 1-indexed lol
        x1, y1 = map(x -> parse(Int, x) + 1, pairs[i, 1])
        x2, y2 = map(x -> parse(Int, x) + 1, pairs[i, 3])
        if x1 == x2
            for y = min(y1, y2):max(y1, y2)
                increment(vents, x1, y)
            end
        elseif y1 == y2
            for x = min(x1, x2):max(x1, x2)
                increment(vents, x, y1)
            end
        elseif abs(x1 - x2) == abs(y1 - y2)
            if (x2 > x1) == (y2 > y1)
                for n = 0:abs(x1 - x2)
                    increment(vents, min(x1, x2) + n, min(y1, y2) + n)
                end
            else
                for n = 0:abs(x1 - x2)
                    increment(vents, min(x1, x2) + n, max(y1, y2) - n)
                end
            end
        end

        # display(vents)
    end
    println(count(v -> v > 1, vents))

end

@inline increment(arr, x, y) = arr[x, y] += 1
@time solve()
