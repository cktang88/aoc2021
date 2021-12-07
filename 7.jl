arr = map(e -> parse(Int, e), split(readlines("./7.txt")[1], ","))
function solve()
    # guess = floor(sum(arr) / length(arr))\
    findmin(map(i -> cost(arr, i), eachindex(arr)))[1]
end
@inline cost(arr, i) = sum(x -> abs(x - i) * (abs(x - i) + 1) / 2, arr)
@time res = solve()
print(res)

