function solve()
    arr = map(e -> split(e, " | "), readlines("./8.txt"))
    res = 0
    for a in arr
        d = Dict()
        w = split(a[1], " ")
        println(w)
        one = filter(e -> length(e) == 2, w)
        four = filter(e -> length(e) == 4, w)
        seven = filter(e -> length(e) == 3, w)
        eight = filter(e -> length(e) == 7, w)
        println(one)
        d[one] = 1
        d[four] = 4
        d[seven] = 7
        d[eight] = 8
        println(filter(c -> !contains(seven, c), one)) # top segment
        println(filter(c -> !contains(four, c), seven))
        println(filter(c -> !contains(eight, c), six)) # upper right
        println(filter(c -> !contains(zero, c), eight)) # mid
        println(filter(c -> !contains(six, c), two)) # bottom right
        println(filter(c -> !contains(five, c), six)) # bottom left
        # println()
        # res += count(e -> length(e) == 2 || length(e) == 3 || length(e) == 4 || length(e) == 7, split(a[2], " "))
    end
        # guess = floor(sum(arr) / length(arr))
    # println(guess)
    # res = findmin(map(i -> cost(arr, i), eachindex(arr)))
    return res
end
@time res = solve()
println(res)



acedgfb:8
cdfbe:5
gcdfa:2
fbcad:3
dab:7
cefabd:9
cdfgeb:6
eafb:4
cagedb:0
ab:1
