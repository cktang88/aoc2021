using DelimitedFiles


function solve()
    arr = readdlm("./3.txt", String) # reads into matrix
    gamma, epsilon = "", ""
    for j in 1:length(arr[1])
        col = map(x -> x[j], arr)
        cnt = count(x -> x == '1', col)
        # println(cnt)
        gamma *= cnt > length(col) / 2 ? "1" : "0"
        epsilon *= cnt < length(col) / 2 ? "1" : "0"
    end
    println(parse(Int, gamma, base=2) * parse(Int, epsilon, base=2))
end

print(solve())
    
