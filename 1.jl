using DelimitedFiles

arr = readdlm("./1.txt")

function solve()
    res = 0
    for i = 4:length(arr)
        if arr[i] > arr[i - 3]
            res += 1
        end
    end
    return res

end

@time res = solve()
print(res)
    
