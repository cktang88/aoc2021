using DelimitedFiles


function solve()
    arr = readdlm("./2.txt") # reads into matrix
    words, dist = eachcol(arr) # views
    
    horiz, aim, depth = 0, 0, 0
    for i = 1:length(words)
        if words[i] == "down"
            aim += dist[i]
        elseif words[i] == "forward"
            horiz += dist[i]
            depth += aim * dist[i]
        elseif words[i] == "up"
            aim -= dist[i]
        end
    end
    
    return horiz * depth

end

@time println(solve())
    
