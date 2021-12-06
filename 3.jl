arr = readlines("./3.txt")

function solve()
    # gamma, epsilon = aggregate_bits(arr)
    # return parse_bin(gamma) * parse_bin(epsilon)

    # part 2
    bnum = recurse_filter(arr)
    o2 = parse_bin(bnum)
    bnum = recurse_filter(arr, use_gamma=false)
    co2 = parse_bin(bnum)
    return o2 * co2
end

function aggregate_bits(arr)
    gamma, epsilon = "", ""
    numrows = length(arr)
    for j = eachindex(arr[1])
        ones = count(x -> x[j] == '1', arr)
        gamma *= ones >= numrows / 2 ? "1" : "0"
        epsilon *= ones < numrows / 2 ? "1" : "0"
    end
    return gamma, epsilon
end

function parse_bin(n::String)
    return parse(Int, n, base=2)
end

function recurse_filter(arr;use_gamma=true)
    for j = eachindex(arr[1])
        gamma, epsilon = aggregate_bits(arr)
        arr = filter(x -> x[j] == (use_gamma ? gamma[j] : epsilon[j]), arr)
        if length(arr) == 1
            return arr[1]
        elseif length(arr) == 0
            throw(ErrorException("Array now empty..."))
        end
    end
end

@time res = solve()
println(res)
    
