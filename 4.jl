using DelimitedFiles

function solve()
    arr = readdlm("./4.txt", skipblanks=true)
    pulls = map(x -> parse(Int, x), split(arr[1], ","))
    boards = []
    for i in range(2, size(arr, 1) - 1, step=5)
        push!(boards, arr[i:i + 4, :])
    end

    lastboard = nothing
    for num in pulls
        for i in 1:length(boards)
            boards[i] = mark(boards[i], num)
            # if check(boards[i])
            #     println("Done: ", sum_remaining(boards[i]) * num)
            #     return
            # end
        end

        # part 2
        boards = filter(b -> !check(b), boards)

        if length(boards) == 0
            println("Done: ", num, " ", sum_remaining(mark(lastboard, num)) * num)
            break
        elseif length(boards) == 1
            lastboard = boards[1]
        end
    end
end

function sum_remaining(board)
    return sum(filter(x ->  x > -1, board))
end

function check(board)
    function allmarked(arr)
        return all(map(x -> x == -1, arr))
    end
    return any(allmarked(board[i, :]) || allmarked(board[:, i]) for i = 1:5)
end

function mark(board, num::Int)
    #= mark squares with -1, if pulled =#
    return [e == num ? -1 : e for e in board]
end

@time solve()
