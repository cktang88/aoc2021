function solve()
    arr = hcat([map(e -> parse(Int, e), collect(line)) for line in readlines("./9.txt")]...)
    # display(arr)
    h, w = size(arr)
    # println(h, w)
    mask = fill(1, size(arr))
    for x in 1:h, y in 1:w
        if x > 1 && arr[x,y] >= arr[x - 1,y]
            mask[x,y] = 0
        end
        if y > 1 && arr[x,y] >= arr[x,y - 1]
            mask[x,y] = 0
        end

        if x < h && arr[x,y] >= arr[x + 1,y]
            mask[x,y] = 0
        end
        if y < w && arr[x,y] >= arr[x ,y + 1]
            mask[x,y] = 0
        end
    end
    # display(mask)
    sum = 0
    for x in 1:h, y in 1:w
        if mask[x,y] == 1
            sum += arr[x,y] + 1
        end
    end
    return sum
end
@inline cost(arr, i)::Int = sum(x -> abs(x - i) * (abs(x - i) + 1) // 2, arr)
@time res = solve()
println(res)

