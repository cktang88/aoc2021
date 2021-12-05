using DelimitedFiles

function solve()
    arr = readdlm("./5.txt", ) # reads into matrix
    pairs = map(x -> split(x, ","), arr)
    
    # vents = zeros(Int8, 10, 10)
    vents = zeros(Int8, 1000, 1000)
    for i = 1:size(pairs, 1)
        x1, y1 = map(x -> parse(Int, x), pairs[i, 1])
        x2, y2 = map(x -> parse(Int, x), pairs[i, 3])
        if x1 == x2
            x = x1
            for y = min(y1, y2):max(y1, y2)
                vents[x + 1,y + 1] += 1
            end
        elseif y1 == y2
            y = y1
            for x = min(x1, x2):max(x1, x2)
                vents[x + 1,y + 1] += 1
            end
        elseif abs(x1 - x2) == abs(y1 - y2)
            if (x2 > x1) == (y2 > y1)
                for n = 0:abs(x1 - x2)
                    vents[min(x1, x2) + n + 1, min(y1, y2) + n + 1] += 1
                end
            else
                for n = 0:abs(x1 - x2)
                    vents[min(x1, x2) + n + 1, max(y1, y2) - n + 1] += 1
                end
            end
        end

        # display(vents)
    end
    println(length(filter(x -> x > 1, vents)))

end
@time solve()
