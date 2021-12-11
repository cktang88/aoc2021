function solve()
    arr = hcat([map(e -> parse(Int, e), collect(line)) for line in readlines("./9.txt")]...)
    # display(arr)
    h, w = size(arr)
    # println(h, w)
    mask = fill(1, size(arr))
    lastzeroes = 0
    while true
        for x in 1:h, y in 1:w
            val = arr[x,y]
            if val == 9
                mask[x,y] = 0
                continue
            end
            if x > 1 && val >= arr[x - 1,y]
                mask[x - 1,y] += mask[x,y]
                mask[x,y] = 0
            end
            if y > 1 && val >= arr[x,y - 1]
                mask[x,y - 1] += mask[x,y]
                mask[x,y] = 0
            end
            if x < h && val >= arr[x + 1,y]
                mask[x + 1,y] += mask[x,y]
                mask[x,y] = 0
            end
            if y < w && val >= arr[x ,y + 1]
                mask[x ,y + 1] += mask[x,y]
                mask[x,y] = 0
            end
        end
        if countzeroes(mask) == lastzeroes
            break
        end
        lastzeroes = countzeroes(mask)
    end
    open("9out.txt", "w") do file
        for row in eachrow(mask)
            println(file, row)
        end
    end
    display(mask)

    res = []
    for x in 1:h, y in 1:w
        if mask[x,y] > 0
            push!(res, mask[x,y])
        end
    end
    return sort(res)
end
function countzeroes(arr)
    h, w = size(arr)
    c = 0
    for x in 1:h, y in 1:w
        if arr[x,y] == 0
            c += 1
        end
    end
    return c

end
# function surrounded_by_zeroes(arr, x, y, w, h)
#     if x > 1 && arr[x - 1,y] > 0
#         return false
#     end
#     if y > 1 && arr[x,y - 1] > 0
#         return false
#     end
#     if x < h && arr[x + 1,y] > 0
#         return false
#     end
#     if y < w && arr[x ,y + 1] > 0
#         return false
#     end
#     return true
# end
    
@inline cost(arr, i)::Int = sum(x -> abs(x - i) * (abs(x - i) + 1) // 2, arr)
@time res = solve()
println(res)

