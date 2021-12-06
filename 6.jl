using Base:reduce_empty
arr = map(e -> parse(Int, e), split(readlines("./6.txt")[1], ","))
function solve()
    fish = [0,0,0,0,0,0,0,0,0]
    for i in arr
        fish[i + 1] += 1 # julia's 1-indexed rip
    end
    for d = 1:256
        fish = circshift(fish, -1)
        fish[7] += fish[9]
    end
    return sum(fish)
end
@time res = solve()
print(res)

