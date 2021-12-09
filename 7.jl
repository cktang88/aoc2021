function solve()
    arr = map(e -> parse(Int, e), split(readlines("./7.txt")[1], ","))
    # guess = floor(sum(arr) / length(arr))
    # println(guess)
    res = findmin(map(i -> cost(arr, i), eachindex(arr)))
    return res
end
@inline cost(arr, i)::Int = sum(x -> abs(x - i) * (abs(x - i) + 1) // 2, arr)
@time res = solve()
println(res)

