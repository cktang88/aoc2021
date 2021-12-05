using DelimitedFiles


arr = readdlm("./3.txt", String)

function solve()
    # gamma, epsilon = aggregate_bits(arr)
    # println(parse_bin(gamma) * parse_bin(epsilon))

    # part 2
    bnum = recurse_filter(arr)
    o2 = parse_bin(bnum)
    bnum = recurse_filter(arr, use_gamma=false)
    co2 = parse_bin(bnum)
    res = o2 * co2
end

function aggregate_bits(arr)
    gamma, epsilon = "", ""
    numcols = length(arr[1])
    for j in 1:numcols
        col = map(x -> x[j], arr)
        numrows = length(col)
        cnt = count(x -> x == '1', col)

        gamma *= cnt >= numrows / 2 ? "1" : "0"
        epsilon *= cnt < numrows / 2 ? "1" : "0"
    end
    return gamma, epsilon
end

function parse_bin(n::String)
    return parse(Int, n, base=2)
end

function recurse_filter(origArray;use_gamma=true)
    arr = copy(origArray)
    for j in 1:length(arr[1])
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
    
