using DelimitedFiles



function solve()
    arr = readdlm("./4test.txt", skipblanks=true)
    pulls = split(arr[1], ",")
    println(pulls)
    boards = []
    println(size(arr, 1))
    for i in range(2, size(arr, 1) - 1, step=5)
        push!(boards, arr[i:i + 5, :])
    end
    for b in boards
        println(b)
    end
end
solve()
